# 🚀 Instruções para Configurar o Repositório no GitHub

## 📋 Checklist de Configuração

### 1. Criar o Repositório no GitHub

1. Acesse [GitHub](https://github.com)
2. Clique em **"New repository"**
3. Configure:
   - **Repository name**: `workshop-n8n-uepg`
   - **Description**: "Workshop sobre automações com N8N e EvolutionAPI - UEPG"
   - **Visibility**: Public (para que os alunos possam acessar)
   - ✅ **Add a README file**: Desmarque (já temos um)
   - ✅ **Add .gitignore**: Desmarque (já temos um)
   - ✅ **Choose a license**: MIT License (recomendado)

### 2. Subir os Arquivos

```bash
# No terminal local, na pasta do projeto:
git init
git add .
git commit -m "Initial commit: Workshop N8N + EvolutionAPI"
git branch -M main
git remote add origin https://github.com/luizgununes/workshop-n8n-uepg.git
git push -u origin main
```

### 3. Configurar GitHub Codespaces

#### 3.1 Habilitar Codespaces
1. No repositório, vá em **Settings**
2. Clique em **Codespaces** (no menu lateral)
3. Certifique-se que está habilitado

#### 3.2 Configurar Prebuilds (Opcional mas Recomendado)
1. Em **Settings > Codespaces**
2. Clique em **Set up prebuild**
3. Configure:
   - **Configuration file**: `.devcontainer/devcontainer.json`
   - **Regions**: Use default (ou escolha mais próximo)
   - **Trigger**: On push to main branch

### 4. Testar o Ambiente

#### 4.1 Criar um Codespace de Teste
1. No repositório, clique em **Code**
2. Vá na aba **Codespaces**
3. Clique em **Create codespace on main**
4. Aguarde a configuração (2-5 minutos)

#### 4.2 Verificar Funcionamento
Após a configuração, verifique se:
- ✅ VS Code abriu corretamente
- ✅ Script de pós-criação executou
- ✅ Docker containers estão rodando
- ✅ N8N está acessível na porta 5678
- ✅ EvolutionAPI está acessível na porta 8080
- ✅ EvolutionAPI Manager está acessível na porta 8081

### 5. Preparar para o Workshop

#### 5.1 Documentação
- ✅ README.md está completo e claro
- ✅ Guia passo-a-passo está na pasta `docs/`
- ✅ Exemplos estão documentados

#### 5.2 Comunicação aos Alunos
Envie as seguintes informações:

**Assunto**: Workshop N8N + EvolutionAPI - Preparação

```
Olá pessoal!

Para o workshop de automações com N8N e EvolutionAPI, vocês precisarão apenas de:

🔗 Link do repositório: https://github.com/luizgununes/workshop-n8n-uepg

📋 Pré-requisitos:
- Conta no GitHub (gratuita)
- Navegador web atualizado
- WhatsApp instalado no celular

🚀 Como acessar:
1. Abram o link do repositório
2. Cliquem em "Code" → "Codespaces" → "Create codespace on main"
3. Aguardem alguns minutos para configurar

O ambiente será idêntico para todos, independente do sistema operacional!

Nos vemos no workshop! 🎉
```

### 6. Durante o Workshop

#### 6.1 Monitoramento
- Fique de olho no uso de Codespaces
- Tenha um ambiente local como backup
- Prepare-se para ajudar com autenticação GitHub

#### 6.2 Suporte
- README.md tem troubleshooting básico
- Use o terminal do Codespace para debug
- Comandos úteis estão documentados

### 7. Configurações Avançadas (Opcional)

#### 7.1 Secrets para Produção
Se quiser demonstrar integração com APIs reais:
1. Vá em **Settings > Secrets and variables > Codespaces**
2. Adicione secrets necessários
3. Referencie no `.devcontainer/devcontainer.json`

#### 7.2 Customização
- Modifique `docker-compose.yml` conforme necessário
- Adicione extensões VS Code em `devcontainer.json`
- Customize scripts em `.devcontainer/`

## ✅ Verificação Final

Antes do workshop, teste:
- [ ] Criação de Codespace funciona
- [ ] Todos os serviços sobem corretamente
- [ ] N8N faz login com credenciais padrão
- [ ] EvolutionAPI aceita conexões
- [ ] Workflow de exemplo funciona
- [ ] Documentação está clara

## 🆘 Problemas Comuns

### Codespace não inicia
- Verifique se tem créditos disponíveis
- Tente uma máquina menor (2-core)
- Verifique se arquivos .devcontainer estão corretos

### Serviços não sobem
- Verifique logs: `docker-compose logs`
- Reinicie: `docker-compose restart`
- Verifique portas: `docker-compose ps`

### Performance lenta
- Use máquina 4-core para melhor performance
- Configure prebuilds para acelerar
- Feche abas desnecessárias

---

**Boa sorte com o workshop! 🚀**
