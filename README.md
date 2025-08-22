# Workshop N8N + EvolutionAPI - UEPG

Este repositório contém o ambiente completo para o workshop sobre automações com N8N e EvolutionAPI.

## 🚀 Como usar este repositório

### Opção 1: GitHub Codespaces (Recomendado)

1. Clique no botão "Code" no GitHub
2. Selecione a aba "Codespaces"
3. Clique em "Create codespace on main"
4. Aguarde o ambiente ser configurado automaticamente

O Codespace já virá com:
- N8N instalado e configurado
- EvolutionAPI configurada
- Todas as dependências necessárias
- Portas expostas para acesso às aplicações

### Opção 2: Executar localmente

Se preferir executar localmente, você precisará ter Docker e Docker Compose instalados:

```bash
git clone https://github.com/luizgununes/workshop-n8n-uepg.git
cd workshop-n8n-uepg
docker-compose up -d
```

## 🔗 Acessos

Após o ambiente estar rodando:

- **N8N**: http://localhost:5678
- **EvolutionAPI**: http://localhost:8080
- **EvolutionAPI Manager**: http://localhost:8081

## 📋 Credenciais padrão

### N8N
- **Email**: admin@workshop.com
- **Senha**: workshop123

### EvolutionAPI
- **API Key**: workshop-evolution-key
- **Global API Key**: global-workshop-key

## 📚 Conteúdo do Workshop

1. **Introdução ao N8N**
   - Interface e conceitos básicos
   - Criação de workflows
   - Nós principais

2. **Configuração da EvolutionAPI**
   - Criação de instâncias
   - Configuração de webhooks
   - Autenticação e segurança

3. **Integrações Práticas**
   - Envio de mensagens automáticas
   - Processamento de respostas
   - Integrações com outros serviços

4. **Casos de Uso**
   - Atendimento automático
   - Notificações de sistema
   - Integração com CRM/ERP

## 🛠️ Estrutura do Projeto

```
workshop-n8n-uepg/
├── .devcontainer/          # Configuração do GitHub Codespaces
├── docker-compose.yml      # Orquestração dos serviços
├── n8n/                    # Configurações e workflows do N8N
├── evolution-api/          # Configurações da EvolutionAPI
├── examples/               # Exemplos de workflows
└── docs/                   # Documentação adicional
```

## 🔧 Solução de Problemas

### Configurações Alternativas

Este repositório inclui múltiplas configurações para máxima compatibilidade:

- **`docker-compose.yml`**: Configuração completa com N8N + EvolutionAPI
- **`docker-compose.simple.yml`**: Configuração simplificada apenas com N8N
- **`troubleshoot.sh`**: Script automático que escolhe a melhor configuração

### Script de Troubleshooting

Se houver problemas, execute no terminal do Codespace:

```bash
./troubleshoot.sh
```

Este script irá:
- Verificar conectividade
- Testar disponibilidade das imagens Docker
- Escolher automaticamente a melhor configuração
- Iniciar os serviços apropriados

### Problema: Portas não estão acessíveis
**Solução**: No Codespace, verifique se as portas estão sendo encaminhadas corretamente na aba "Ports".

### Problema: N8N não carrega
**Solução**: Verifique se o container está rodando com `docker ps` e reinicie se necessário.

### Problema: EvolutionAPI não conecta
**Solução**: Execute `./troubleshoot.sh` que irá usar uma configuração alternativa se necessário.

### Problema: Imagens Docker não são encontradas
**Solução**: O script de troubleshooting irá automaticamente usar configurações alternativas.

## 📞 Suporte

Em caso de dúvidas durante o workshop, levante a mão ou chame o instrutor.

## 📝 Licença

Este material é destinado exclusivamente para o workshop na UEPG.
