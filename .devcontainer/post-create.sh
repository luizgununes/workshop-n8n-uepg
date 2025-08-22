#!/bin/bash

echo "🚀 Configecho "📦 Docker está funcionando! Iniciando configuração obrigatória..."

# Tornar scripts executáveis
chmod +x ./troubleshoot.sh

# Verificar se docker-compose está disponível
if ! command -v docker-compose >/dev/null 2>&1; then
    echo "📥 Instalando docker-compose..."
    sudo apt-get update >/dev/null 2>&1
    sudo apt-get install -y docker-compose >/dev/null 2>&1
fi

# Executar configuração OBRIGATÓRIA
echo "🔧 Executando configuração obrigatória (N8N + EvolutionAPI)..."
./troubleshoot.sh

# Verificar se o troubleshoot teve sucesso
if [ $? -ne 0 ]; then
    echo ""
    echo "❌ FALHA NA CONFIGURAÇÃO OBRIGATÓRIA!"
    echo "📞 SOLICITE AJUDA AO INSTRUTOR!"
    exit 1
fi do workshop..."
echo "⚠️  N8N + EvolutionAPI são OBRIGATÓRIOS!"
echo ""

# Aguardar Docker estar disponível
echo "⏳ Aguardando Docker estar disponível..."
for i in {1..60}; do
    if docker info >/dev/null 2>&1; then
        echo "✅ Docker está disponível!"
        break
    fi
    echo "Tentativa $i/60 - Docker ainda não disponível..."
    sleep 2
done

# Verificar se Docker está funcionando
if ! docker info >/dev/null 2>&1; then
    echo "❌ ERRO CRÍTICO: Docker não está disponível após 2 minutos"
    echo "📞 SOLICITE AJUDA AO INSTRUTOR!"
    echo ""
    echo "🔧 Comandos para tentar resolver:"
    echo "  sudo service docker start"
    echo "  ./troubleshoot.sh"
    exit 1
fi

echo "📦 Docker está funcionando! Iniciando serviços..."

# Tornar scripts executáveis
chmod +x ./troubleshoot.sh

# Verificar se docker-compose está disponível
if ! command -v docker-compose >/dev/null 2>&1; then
    echo "� Instalando docker-compose..."
    sudo apt-get update >/dev/null 2>&1
    sudo apt-get install -y docker-compose >/dev/null 2>&1
fi

# Executar configuração automática
echo "🔧 Executando configuração automática..."
./troubleshoot.sh

echo ""
echo "✅ CONFIGURAÇÃO OBRIGATÓRIA CONCLUÍDA!"
echo ""
echo "🌐 Para acessar as aplicações:"
echo "  • Vá na aba 'PORTS' do VS Code"
echo "  • Clique nos links das portas:"
echo "    - 5678 (N8N) - OBRIGATÓRIO"
echo "    - 8080 (EvolutionAPI) - OBRIGATÓRIO"
echo "    - 8081 (EvolutionAPI Manager)"
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
echo "🔑 Credenciais N8N:"
echo "  • Email: admin@workshop.com"
echo "  • Senha: workshop123"
echo ""
echo "📚 Consulte o README.md para mais informações!"
