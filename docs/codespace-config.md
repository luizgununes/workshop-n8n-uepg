# Configurações do GitHub Codespaces

## Configurações Recomendadas

### Machine Type
- **2-core**: Para testes básicos (grátis)
- **4-core**: Recomendado para o workshop (mais performance)

### Prebuilds
Este repositório está configurado com prebuilds para acelerar a criação dos Codespaces.

### Portas Expostas
- **5678**: N8N Interface
- **8080**: EvolutionAPI
- **8081**: EvolutionAPI Manager

### Extensões Instaladas
- JSON Language Features
- TypeScript Language Features
- Prettier - Code formatter
- ESLint

### Recursos do Ambiente
- Docker e Docker Compose
- Node.js LTS
- Python 3
- Git
- Zsh com Oh My Zsh

## Limites de Uso

### GitHub Free
- 120 core hours/mês
- 15 GB storage

### GitHub Pro
- 180 core hours/mês
- 20 GB storage

### GitHub Team/Enterprise
- Sem limite de core hours
- Storage conforme plano

## Comandos Úteis

```bash
# Verificar status dos containers
docker-compose ps

# Ver logs de um serviço
docker-compose logs n8n
docker-compose logs evolution-api

# Reiniciar serviços
docker-compose restart

# Parar todos os serviços
docker-compose down

# Iniciar novamente
docker-compose up -d
```

## Personalização

Você pode personalizar o ambiente editando:
- `.devcontainer/devcontainer.json`: Configurações do VS Code
- `docker-compose.yml`: Serviços Docker
- `.devcontainer/post-create.sh`: Script de inicialização
