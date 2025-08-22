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

1. Abra este repositório no GitHub Codespaces
2. Aguarde a configuração automática (pode levar alguns minutos)
3. O script de configuração rodará automaticamente
4. Quando finalizado, acesse os serviços:

### 🌐 Acessos

- **N8N**: http://localhost:5678
- **EvolutionAPI**: http://localhost:8080  
- **EvolutionAPI Manager**: http://localhost:8081

### 🔑 Credenciais

**N8N:**
- Email: `admin@workshop.com`
- Senha: `workshop123`

**EvolutionAPI:**
- API Key: `workshop-evolution-key`
- Global API Key: `global-workshop-key`

## 🛠️ Solução de Problemas

Se algo não funcionar:

1. Execute o script de configuração manualmente:
   ```bash
   ./troubleshoot.sh
   ```

2. Verifique os logs dos serviços:
   ```bash
   docker compose logs
   ```

3. Solicite ajuda ao instrutor! 😊

---

**Feito para o Workshop UEPG**
