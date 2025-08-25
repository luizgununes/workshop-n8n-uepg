#!/bin/bash

echo "🔧 Configurando variáveis do Codespace..."

if [ -n "$CODESPACE_NAME" ]; then
    echo "GitHub Codespace detectado: $CODESPACE_NAME"
    
    # Configurar docker-compose.yml
    if [ -f "docker-compose.yml" ]; then
        sed -i "s/\${CODESPACE_NAME}/$CODESPACE_NAME/g" docker-compose.yml
        echo "✅ docker-compose.yml configurado"
    fi
    
    # Configurar .env
    if [ -f ".env" ]; then
        sed -i "s/\${CODESPACE_NAME}/$CODESPACE_NAME/g" .env
        echo "✅ .env configurado"
    fi
    
    echo "✅ Configuração das variáveis concluída!"
else
    echo "⚠️ CODESPACE_NAME não encontrado (ambiente local)"
fi
