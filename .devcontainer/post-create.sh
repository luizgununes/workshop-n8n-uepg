#!/bin/bash

echo "🚀 Configurando ambiente do workshop..."

# Aguardar um momento para garantir que tudo esteja pronto
sleep 5

# Iniciar os serviços
echo "📦 Iniciando serviços Docker..."
docker-compose up -d

# Aguardar os serviços estarem prontos
echo "⏳ Aguardando serviços ficarem prontos..."
sleep 30

# Verificar se os serviços estão rodando
echo "🔍 Verificando status dos serviços..."
docker-compose ps

# Aguardar um pouco mais para garantir que tudo esteja estável
sleep 15

echo "✅ Ambiente configurado com sucesso!"
echo ""
echo "🌐 Acesse as aplicações:"
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
echo ""
echo "📚 Consulte o README.md para mais informações!"
