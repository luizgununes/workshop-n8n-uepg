# Guia Passo a Passo - Workshop N8N + EvolutionAPI

## 🎯 Objetivos do Workshop

Ao final deste workshop, você será capaz de:
- Configurar e usar o N8N para criar automações
- Integrar o N8N com a EvolutionAPI para WhatsApp
- Criar fluxos de atendimento automático
- Implementar webhooks e integrações

## 📋 Pré-requisitos

✅ Conta no GitHub  
✅ Navegador web atualizado  
✅ Conexão com internet estável  

## 🚀 Passo 1: Configurando o Ambiente

### 1.1 Acessando o Codespace

1. Acesse o repositório: `https://github.com/luizgununes/workshop-n8n-uepg`
2. Clique no botão verde **"Code"**
3. Selecione a aba **"Codespaces"**
4. Clique em **"Create codespace on main"**
5. Aguarde 2-3 minutos para o ambiente ser configurado

### 1.2 Verificando os Serviços

Após a configuração, você verá 3 abas abertas no navegador:
- **N8N** (porta 5678): Interface principal de automação
- **EvolutionAPI** (porta 8080): API do WhatsApp
- **EvolutionAPI Manager** (porta 8081): Interface de gerenciamento

## 🔧 Passo 2: Configuração Inicial

### 2.1 Acessando o N8N

1. Clique na aba do N8N ou acesse `http://localhost:5678`
2. Faça login com as credenciais:
   - **Email**: `admin@workshop.com`
   - **Senha**: `workshop123`

### 2.2 Criando uma Instância no WhatsApp

1. Acesse o EvolutionAPI Manager: `http://localhost:8081`
2. Clique em **"Create Instance"**
3. Use as configurações:
   - **Instance Name**: `workshop-instance`
   - **Token**: `workshop-evolution-key`
4. Escaneie o QR Code com seu WhatsApp

## 📱 Passo 3: Primeiro Workflow

### 3.1 Criando um Webhook

1. No N8N, clique em **"New Workflow"**
2. Adicione o nó **"Webhook"**
3. Configure:
   - **HTTP Method**: POST
   - **Path**: `workshop-webhook`
4. Copie a URL do webhook

### 3.2 Configurando o Webhook na EvolutionAPI

1. Acesse: `http://localhost:8080/manager/workshop-instance`
2. Em **"Webhook"**, cole a URL copiada
3. Ative os eventos: `MESSAGE_CREATE`, `MESSAGE_UPDATE`

### 3.3 Processando Mensagens

1. No N8N, adicione o nó **"IF"** após o webhook
2. Configure a condição:
   ```
   {{$json.message.messageType}} equals textMessage
   ```

### 3.4 Enviando Resposta

1. Adicione o nó **"HTTP Request"**
2. Configure:
   - **URL**: `http://evolution-api:8080/message/sendText/workshop-instance`
   - **Method**: POST
   - **Headers**: `apikey: workshop-evolution-key`
   - **Body**:
     ```json
     {
       "number": "{{$json.key.remoteJid}}",
       "text": "Olá! Recebi: {{$json.message.conversation}}"
     }
     ```

## 🎮 Passo 4: Testando o Workflow

1. Ative o workflow no N8N
2. Envie uma mensagem para o número conectado
3. Verifique se recebeu a resposta automática
4. Confira os logs de execução no N8N

## 🔄 Passo 5: Workflows Avançados

### 5.1 Menu Interativo

Crie um menu com opções:
```
🤖 *Menu de Opções*

1️⃣ Informações
2️⃣ Suporte
3️⃣ Vendas
4️⃣ Falar com humano

Digite o número da opção desejada.
```

### 5.2 Integração com APIs

- Consultar CEP via ViaCEP
- Buscar informações de produtos
- Salvar dados em planilhas Google

### 5.3 Agendamento de Mensagens

- Usar o nó **"Cron"** para disparos periódicos
- Enviar mensagens de lembrete
- Relatórios automáticos

## 📊 Passo 6: Monitoramento

### 6.1 Logs e Execuções

1. No N8N, acesse **"Executions"**
2. Analise execuções bem-sucedidas e com erro
3. Use o debugger para identificar problemas

### 6.2 Webhooks de Status

Configure webhooks para:
- Conexão/desconexão do WhatsApp
- Status de mensagens (entregue, lida)
- Erros de envio

## 🎯 Exercícios Práticos

### Exercício 1: Bot de Atendimento
Crie um bot que:
- Receba o nome do cliente
- Ofereça um menu de opções
- Responda baseado na escolha

### Exercício 2: Consulta de CEP
Crie um workflow que:
- Receba um CEP via WhatsApp
- Consulte a API do ViaCEP
- Retorne o endereço completo

### Exercício 3: Sistema de Tickets
Implemente:
- Criação de tickets
- Atribuição de números únicos
- Status de acompanhamento

## 🆘 Solução de Problemas

### Problema: Webhook não recebe dados
**Causa**: URL incorreta ou instância desconectada
**Solução**: Verifique a URL e reconecte a instância

### Problema: Mensagem não é enviada
**Causa**: API Key incorreta ou número inválido
**Solução**: Verifique as credenciais e formato do número

### Problema: Workflow não executa
**Causa**: Workflow inativo ou erro de configuração
**Solução**: Ative o workflow e verifique os nós

## 📚 Recursos Adicionais

- [Documentação N8N](https://docs.n8n.io/)
- [Documentação EvolutionAPI](https://doc.evolution-api.com/)
- [Comunidade N8N](https://community.n8n.io/)

## 🏆 Próximos Passos

Após o workshop, você pode:
- Implementar em produção
- Explorar mais nós do N8N
- Integrar com outros serviços
- Criar automações complexas

---

**Bom workshop! 🚀**
