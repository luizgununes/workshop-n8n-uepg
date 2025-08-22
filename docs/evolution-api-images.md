# Referência de Imagens EvolutionAPI

## 📦 Imagens Disponíveis no Docker Hub

### Principais (Mais Confiáveis)

1. **`atendai/evolution-api`** ⭐ **(Recomendada)**
   - Downloads: 1M+
   - Stars: 123
   - Última atualização: 3 meses atrás
   - Status: Mantida ativamente

2. **`evoapicloud/evolution-api`**
   - Downloads: 100K+
   - Stars: 44
   - Última atualização: 6 dias atrás
   - Status: Bem mantida

### Alternativas

3. **`luissantostsx/evolution-api`**
   - Downloads: 3.6K
   - Última atualização: 2 dias atrás

4. **`douglas2dev/evolution-api`**
   - Downloads: 2.8K
   - Última atualização: 1 ano atrás

## 🔄 Estratégia de Fallback

O repositório está configurado com múltiplas estratégias:

### 1. Configuração Principal (`docker-compose.yml`)
```yaml
image: atendai/evolution-api:latest
```

### 2. Configuração Alternativa (`docker-compose.alternative.yml`)
```yaml
image: evolution-api/evolution-api:latest
```

### 3. Configuração Simplificada (`docker-compose.simple.yml`)
- Apenas N8N sem EvolutionAPI
- Usa `webhook-tester` para simular APIs

## 🛠️ Comandos Úteis

### Testar disponibilidade de imagem
```bash
docker pull atendai/evolution-api:latest
```

### Listar imagens locais
```bash
docker images | grep evolution
```

### Verificar logs da EvolutionAPI
```bash
docker-compose logs evolution-api
```

### Trocar para configuração alternativa
```bash
docker-compose down
docker-compose -f docker-compose.alternative.yml up -d
```

## 🔍 Verificação de Imagens

Antes do workshop, teste a disponibilidade:

```bash
# Testar imagem principal
docker pull atendai/evolution-api:latest

# Se falhar, testar alternativa
docker pull evoapicloud/evolution-api:latest

# Se ambas falharem, usar configuração simplificada
docker-compose -f docker-compose.simple.yml up -d
```

## 📝 Notas para o Workshop

- A configuração principal funciona na maioria dos casos
- O script `troubleshoot.sh` escolhe automaticamente a melhor opção
- Em último caso, use apenas N8N (configuração simplificada)
- Os alunos podem praticar webhooks mesmo sem WhatsApp real
