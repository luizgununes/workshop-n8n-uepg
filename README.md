# Workshop N8N + EvolutionAPI

## 🚀 Ambiente de Workshop Pronto para Uso

Este repositório contém um ambiente completo para o workshop de automações com N8N e EvolutionAPI, otimizado para GitHub Codespaces.

## 📦 O que está incluído

- **N8N**: Plataforma de automação de workflows
- **EvolutionAPI**: API para integração com WhatsApp
- **PostgreSQL**: Banco de dados para N8N e EvolutionAPI
- **Redis**: Cache e sessões
- **Interface Manager**: Interface gráfica para EvolutionAPI

## ▶️ Como usar no Codespace

### 🔧 Configuração Automática

1. Abra este repositório no GitHub Codespaces
2. Execute o script de configuração (executado automaticamente):
   ```bash
   ./troubleshoot.sh
   ```

O script irá:
- Detectar automaticamente o nome do Codespace
- Substituir `${CODESPACE_NAME}` pelos valores corretos
- Configurar e iniciar todos os serviços

### 🌐 Acessos (URLs Dinâmicas)

As URLs são geradas automaticamente baseadas no nome do seu Codespace:

- **N8N**: `https://{CODESPACE_NAME}-5678.app.github.dev`
- **EvolutionAPI**: `https://{CODESPACE_NAME}-8080.app.github.dev`  
- **EvolutionAPI Manager**: `https://{CODESPACE_NAME}-8081.app.github.dev`

### 🔑 Credenciais

**N8N:**
- Email: `admin@workshop.com`
- Senha: `workshop123`

**EvolutionAPI:**
- API Key: `workshop-evolution-key`
- Global API Key: `global-workshop-key`

## 🛠️ Solução de Problemas

Se algo não funcionar:

1. Execute o script de troubleshooting:
   ```bash
   ./troubleshoot.sh
   ```

2. Verifique os logs dos serviços:
   ```bash
   docker compose logs
   ```

3. Reconfigure as URLs dinâmicas:
   ```bash
   Se algo não funcionar:

```bash
./troubleshoot.sh
```
   ```