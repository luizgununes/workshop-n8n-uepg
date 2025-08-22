#!/bin/bash

echo "� Script de Configuração - Workshop N8N + EvolutionAPI"
echo "========================================================"
echo "⚠️  AMBOS N8N E EVOLUTIONAPI SÃO OBRIGATÓRIOS!"
echo ""

# Função para verificar se uma imagem Docker existe
check_image() {
    echo "🔍 Verificando imagem: $1"
    if docker pull $1 >/dev/null 2>&1; then
        echo "✅ Imagem $1 encontrada e baixada"
        return 0
    else
        echo "❌ ERRO: Não foi possível baixar a imagem $1"
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
        echo "❌ ERRO: Problemas de conectividade com Docker Hub"
        return 1
    fi
}

# Parar serviços existentes
echo "🛑 Parando serviços existentes..."
docker-compose down 2>/dev/null || true

# Testar conectividade
if ! test_connectivity; then
    echo ""
    echo "❌ FALHA CRÍTICA: Sem conectividade com Docker Hub"
    echo "📞 SOLICITE AJUDA AO INSTRUTOR!"
    exit 1
fi

# Verificar imagens OBRIGATÓRIAS
echo ""
echo "📦 Verificando TODAS as imagens obrigatórias..."

IMAGES_OK=true

if ! check_image "n8nio/n8n:latest"; then
    IMAGES_OK=false
fi

if ! check_image "atendai/evolution-api:latest"; then
    echo "⚠️  Tentando imagem alternativa da EvolutionAPI..."
    if ! check_image "evoapicloud/evolution-api:latest"; then
        IMAGES_OK=false
    else
        echo "🔄 Atualizando docker-compose para usar imagem alternativa..."
        sed -i 's/atendai\/evolution-api:latest/evoapicloud\/evolution-api:latest/g' docker-compose.yml
    fi
fi

if ! check_image "postgres:15"; then
    IMAGES_OK=false
fi

if ! check_image "redis:7-alpine"; then
    IMAGES_OK=false
fi

# Verificar se todas as imagens estão OK
if [ "$IMAGES_OK" != true ]; then
    echo ""
    echo "❌ FALHA CRÍTICA: Imagens obrigatórias não disponíveis"
    echo "🔧 Possíveis soluções:"
    echo "   1. Verificar conectividade com internet"
    echo "   2. Aguardar alguns minutos e tentar novamente"
    echo "   3. Solicitar ajuda ao instrutor"
    echo ""
    echo "📞 SOLICITE AJUDA AO INSTRUTOR!"
    exit 1
fi

echo ""
echo "✅ Todas as imagens obrigatórias estão disponíveis!"

# Iniciar serviços
echo ""
echo "🚀 Iniciando TODOS os serviços obrigatórios..."
docker-compose up -d

# Aguardar serviços
echo "⏳ Aguardando serviços ficarem prontos..."
sleep 45

# Verificar status
echo ""
echo "📊 Status dos serviços:"
docker-compose ps

# Testar endpoints OBRIGATÓRIOS
echo ""
echo "🔍 Testando endpoints obrigatórios..."

# Testar N8N
echo "🧪 Testando N8N..."
for i in {1..10}; do
    if curl -s --max-time 10 http://localhost:5678 >/dev/null; then
        echo "✅ N8N está funcionando em http://localhost:5678"
        N8N_OK=true
        break
    else
        echo "⏳ Tentativa $i/10 - N8N ainda não disponível..."
        sleep 5
    fi
done

# Testar EvolutionAPI
echo "🧪 Testando EvolutionAPI..."
for i in {1..10}; do
    if curl -s --max-time 10 http://localhost:8080 >/dev/null; then
        echo "✅ EvolutionAPI está funcionando em http://localhost:8080"
        EVOLUTION_OK=true
        break
    else
        echo "⏳ Tentativa $i/10 - EvolutionAPI ainda não disponível..."
        sleep 5
    fi
done

# Verificar se AMBOS estão funcionando
if [ "$N8N_OK" != true ] || [ "$EVOLUTION_OK" != true ]; then
    echo ""
    echo "❌ FALHA CRÍTICA: Serviços obrigatórios não estão funcionando"
    echo ""
    echo "🔍 Logs para diagnóstico:"
    echo "--- N8N ---"
    docker-compose logs --tail=10 n8n
    echo "--- EvolutionAPI ---"
    docker-compose logs --tail=10 evolution-api
    echo ""
    echo "📞 SOLICITE AJUDA AO INSTRUTOR!"
    exit 1
fi

echo ""
echo "🎉 CONFIGURAÇÃO COMPLETA E FUNCIONANDO!"
echo ""
echo "🌐 Acessos disponíveis:"
echo "  • N8N: http://localhost:5678"
echo "  • EvolutionAPI: http://localhost:8080"
echo "  • EvolutionAPI Manager: http://localhost:8081"
echo ""
echo "🔑 Credenciais N8N:"
echo "  • Email: admin@workshop.com"
echo "  • Senha: workshop123"
echo ""
echo "🔑 EvolutionAPI:"
echo "  • API Key: workshop-evolution-key"
echo "  • Global API Key: global-workshop-key"
