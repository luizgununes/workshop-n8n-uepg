#!/bin/bash

echo "🚀 Configurando ambiente do workshop..."

# Aguardar um momento para garantir que tudo esteja pronto
sleep 5

# Executar script de troubleshooting para escolher a melhor configuração
echo "🔧 Executando diagnóstico e configuração automática..."
chmod +x ./troubleshoot.sh
./troubleshoot.sh

echo ""
echo "✅ Ambiente configurado com sucesso!"
echo ""
echo "🌐 Acesse as aplicações nas abas do navegador ou:"
echo "  • N8N: http://localhost:5678"
echo "  • EvolutionAPI: http://localhost:8080 (se disponível)"
echo "  • EvolutionAPI Manager: http://localhost:8081 (se disponível)"
echo ""
echo "🔑 Credenciais N8N:"
echo "  • Email: admin@workshop.com"
echo "  • Senha: workshop123"
echo ""
echo "🔑 EvolutionAPI (se disponível):"
echo "  • API Key: workshop-evolution-key"
echo "  • Global API Key: global-workshop-key"
echo ""
echo "📚 Consulte o README.md para mais informações!"
echo "🆘 Em caso de problemas, execute: ./troubleshoot.sh"
