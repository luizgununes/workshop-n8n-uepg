# Exemplo: Consulta de CEP via WhatsApp

Este workflow permite que usuários consultem endereços enviando um CEP via WhatsApp.

## Como funciona

1. Usuário envia um CEP (formato: 12345-678 ou 12345678)
2. Sistema valida o formato do CEP
3. Consulta a API do ViaCEP
4. Retorna o endereço completo ou erro

## Configuração

### 1. Webhook
- **Path**: `cep-webhook`
- **Method**: POST

### 2. Validação de CEP
- **Regex**: `^\d{5}-?\d{3}$`
- Remove hífen e espaços

### 3. Consulta ViaCEP
- **URL**: `https://viacep.com.br/ws/{{$json.cep}}/json/`
- **Method**: GET

### 4. Resposta Formatada
```
📍 *Endereço Encontrado*

*CEP:* {{$json.cep}}
*Logradouro:* {{$json.logradouro}}
*Bairro:* {{$json.bairro}}
*Cidade:* {{$json.localidade}}
*UF:* {{$json.uf}}
```

## Exemplo de Uso

**Usuário envia:** `01310-100`

**Bot responde:**
```
📍 *Endereço Encontrado*

*CEP:* 01310-100
*Logradouro:* Avenida Paulista
*Bairro:* Bela Vista
*Cidade:* São Paulo
*UF:* SP
```

## Possíveis Melhorias

- Cache de CEPs consultados
- Histórico de consultas por usuário
- Integração com mapas
- Busca por logradouro
