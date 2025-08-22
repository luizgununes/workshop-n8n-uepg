#!/bin/bash

echo "🔧 Script de Troubleshooting - Workshop N8N + EvolutionAPI"
echo "=========================================================="

# Função para verificar se uma imagem Docker existe
check_image() {
    echo "🔍 Verificando imagem: $1"
    if docker pull $1 >/dev/null 2>&1; then
        echo "✅ Imagem $1 encontrada e baixada"
        return 0
    else
        echo "❌ Erro ao baixar imagem $1"
        return 1
    fi
}

# Função para testar conectividade
test_connectivity() {
    echo "🌐 Testando conectividade..."
    if curl -s --max-time 5 https://hub.docker.com >/dev/null; then
        echo "✅ Conectividade com Docker Hub OK"
        return 0
    else
        echo "❌ Problemas de conectividade com Docker Hub"
        return 1
    fi
}

# Parar serviços existentes
echo "🛑 Parando serviços existentes..."
docker-compose down 2>/dev/null || true

# Testar conectividade
test_connectivity

# Verificar imagens principais
echo ""
echo "📦 Verificando disponibilidade das imagens Docker..."

if check_image "n8nio/n8n:latest"; then
    N8N_OK=true
else
    N8N_OK=false
fi

if check_image "atendai/evolution-api:latest"; then
    EVOLUTION_OK=true
else
    EVOLUTION_OK=false
fi

if check_image "postgres:15"; then
    POSTGRES_OK=true
else
    POSTGRES_OK=false
fi

# Determinar qual configuração usar
echo ""
echo "🎯 Determinando melhor configuração..."

if [ "$N8N_OK" = true ] && [ "$EVOLUTION_OK" = true ] && [ "$POSTGRES_OK" = true ]; then
    echo "✅ Todas as imagens estão disponíveis - usando configuração completa"
    COMPOSE_FILE="docker-compose.yml"
elif [ "$N8N_OK" = true ] && [ "$POSTGRES_OK" = true ]; then
    echo "⚠️  EvolutionAPI não disponível - usando configuração simplificada"
    COMPOSE_FILE="docker-compose.simple.yml"
else
    echo "❌ Imagens essenciais não disponíveis - verificar conectividade"
    exit 1
fi

# Iniciar serviços
echo ""
echo "🚀 Iniciando serviços com $COMPOSE_FILE..."
docker-compose -f $COMPOSE_FILE up -d

# Aguardar serviços
echo "⏳ Aguardando serviços ficarem prontos..."
sleep 30

# Verificar status
echo ""
echo "📊 Status dos serviços:"
docker-compose -f $COMPOSE_FILE ps

# Testar endpoints
echo ""
echo "🔍 Testando endpoints..."

# Testar N8N
if curl -s --max-time 10 http://localhost:5678 >/dev/null; then
    echo "✅ N8N está respondendo em http://localhost:5678"
else
    echo "❌ N8N não está respondendo"
fi

# Testar EvolutionAPI (se estiver rodando)
if [ "$COMPOSE_FILE" = "docker-compose.yml" ]; then
    if curl -s --max-time 10 http://localhost:8080 >/dev/null; then
        echo "✅ EvolutionAPI está respondendo em http://localhost:8080"
    else
        echo "❌ EvolutionAPI não está respondendo"
    fi
fi

echo ""
echo "🎉 Configuração concluída!"
echo ""
echo "🌐 Acessos disponíveis:"
echo "  • N8N: http://localhost:5678"
if [ "$COMPOSE_FILE" = "docker-compose.yml" ]; then
    echo "  • EvolutionAPI: http://localhost:8080"
    echo "  • EvolutionAPI Manager: http://localhost:8081"
else
    echo "  • Webhook Tester: http://localhost:8080 (simulador)"
fi
echo ""
echo "🔑 Credenciais N8N:"
echo "  • Email: admin@workshop.com"
echo "  • Senha: workshop123"
