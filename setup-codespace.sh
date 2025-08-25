#!/bin/bash

echo "🚀 Configurando ambiente Workshop N8N + EvolutionAPI"
echo "=================================================="
echo ""

# Detectar se estamos em um Codespace
if [ -n "$CODESPACE_NAME" ]; then
    echo "✅ GitHub Codespace detectado: $CODESPACE_NAME"
    
    # Criar arquivos de configuração com o nome do Codespace
    echo "🔧 Configurando variáveis de ambiente..."
    
    # Substitui CODESPACE_NAME no docker-compose.yml
    if [ -f "docker-compose.yml" ]; then
        sed -i.bak "s/\${CODESPACE_NAME}/$CODESPACE_NAME/g" docker-compose.yml
        echo "✅ docker-compose.yml configurado"
    fi
    
    # Substitui CODESPACE_NAME no .env
    if [ -f ".env" ]; then
        sed -i.bak "s/\${CODESPACE_NAME}/$CODESPACE_NAME/g" .env
        echo "✅ .env configurado"
    fi
    
    # Criar um script start personalizado
    cat > start-workshop.sh << 'EOF'
#!/bin/bash

echo "🐳 Iniciando Workshop N8N + EvolutionAPI"
echo "======================================="
echo ""

# Verificar se Docker está rodando
if ! docker info >/dev/null 2>&1; then
    echo "❌ Docker não está rodando. Iniciando Docker..."
    sudo service docker start
    sleep 5
fi

echo "🚀 Subindo os containers..."
docker compose up -d

echo ""
echo "⏳ Aguardando serviços ficarem prontos..."
echo ""

# Aguardar N8N ficar pronto
echo "Aguardando N8N..."
until curl -s -f -o /dev/null https://$CODESPACE_NAME-5678.app.github.dev/; do
    printf '.'
    sleep 2
done
echo ""

# Aguardar EvolutionAPI ficar pronto
echo "Aguardando EvolutionAPI..."
until curl -s -f -o /dev/null https://$CODESPACE_NAME-8080.app.github.dev/; do
    printf '.'
    sleep 2
done
echo ""

echo "✅ Todos os serviços estão prontos!"
echo ""
echo "🌐 URLs de acesso:"
echo "  📊 N8N: https://$CODESPACE_NAME-5678.app.github.dev"
echo "  📱 EvolutionAPI: https://$CODESPACE_NAME-8080.app.github.dev"
echo "  🖥️  Manager: https://$CODESPACE_NAME-8081.app.github.dev"
echo ""
echo "🔑 Credenciais N8N:"
echo "  Email: admin@workshop.com"
echo "  Senha: workshop123"
echo ""
echo "🔑 EvolutionAPI:"
echo "  API Key: workshop-evolution-key"
echo "  Global Key: global-workshop-key"
echo ""
EOF
    
    chmod +x start-workshop.sh
    echo "✅ Script start-workshop.sh criado"
    
else
    echo "⚠️ Não está executando em um GitHub Codespace"
    echo "Para desenvolvimento local, defina manualmente as variáveis CODESPACE_NAME"
fi

echo ""
echo "✅ Configuração concluída!"
echo ""
echo "Para iniciar o workshop execute:"
echo "  ./start-workshop.sh"
echo ""
