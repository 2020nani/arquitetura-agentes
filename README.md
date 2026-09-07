# 🤖 Cursor Multi-Agent Architecture

Arquitetura multi-agent para desenvolvimento de aplicações utilizando o **Cursor**, agentes especializados e **Model Context Protocol (MCP)**.

O objetivo desta arquitetura é permitir que tarefas de desenvolvimento sejam executadas por agentes especializados, reduzindo duplicação de contexto, melhorando a qualidade das entregas e criando um fluxo estruturado de implementação e validação.

---

# 📋 Visão Geral

A arquitetura é composta por quatro agentes principais:

| Agente                 | Responsabilidade                               |
| ---------------------- | ---------------------------------------------- |
| 🧠 Orchestrator        | Analisa tarefas, cria plano e coordena agentes |
| ☕ Java Specialist      | Implementa funcionalidades backend             |
| 🅰️ Angular Specialist | Implementa funcionalidades frontend            |
| 🧪 QA Validator        | Valida critérios de aceite e testes            |

Além dos agentes, a arquitetura utiliza MCPs especializados:

| MCP            | Utilização                                                      |
| -------------- | --------------------------------------------------------------- |
| Context7       | Consulta documentação atualizada de bibliotecas e frameworks    |
| Playwright MCP | Validação automatizada de funcionalidades e testes de interface |

---

# 🏗️ Arquitetura

```text
                           ┌──────────────────┐
                           │    TASK (.md)    │
                           └────────┬─────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │    ORCHESTRATOR      │
                         │                      │
                         │ Analisa a tarefa     │
                         │ Define estratégia    │
                         │ Delega atividades    │
                         └──────────┬───────────┘
                                    │
                     ┌──────────────┴──────────────┐
                     │                             │
                     ▼                             ▼
            ┌─────────────────┐           ┌─────────────────┐
            │   JAVA AGENT    │           │  ANGULAR AGENT  │
            │                 │           │                 │
            │ Backend         │           │ Frontend        │
            │ Testes          │           │ Testes          │
            │                 │           │                 │
            │ Context7 MCP    │           │ Context7 MCP    │
            └────────┬────────┘           └────────┬────────┘
                     │                             │
                     └──────────────┬──────────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │      QA AGENT        │
                         │                      │
                         │ Critérios de aceite  │
                         │ Cobertura de testes  │
                         │ Regressão            │
                         │                      │
                         │   Playwright MCP     │
                         └──────────┬───────────┘
                                    │
                         ┌──────────┴──────────┐
                         │                     │
                         ▼                     ▼
                  ┌────────────┐      ┌───────────────────┐
                  │  APPROVED  │      │ CHANGES_REQUIRED  │
                  └─────┬──────┘      └─────────┬─────────┘
                        │                       │
                        ▼                       │
                      DONE ◄────────────────────┘
```

---

# 📁 Estrutura do Projeto

```text
.
├── .cursor/
│   │
│   ├── agents/
│   │   ├── 00-orchestrator.md
│   │   ├── 01-java-specialist.md
│   │   ├── 02-angular-specialist.md
│   │   └── 03-qa-validator.md
│   │
│   ├── rules/
│   │   ├── global.md
│   │   ├── architecture.md
│   │   ├── coding-standards.md
│   │   ├── testing.md
│   │   └── mcp-usage.md
│   │
│   ├── workflows/
│   │   ├── feature-workflow.md
│   │   ├── bugfix-workflow.md
│   │   └── hotfix-workflow.md
│   │
│   └── contracts/
│       ├── task-contract.md
│       ├── agent-handoff.md
│       └── qa-report.md
│
├── tasks/
│   ├── backlog/
│   ├── in-progress/
│   ├── review/
│   ├── done/
│   └── failed/
│
├── agent-output/
│   ├── handoffs/
│   └── evidence/
│
└── README.md
```

---

# 🚀 Como Utilizar

## 1. Copie a estrutura para seu projeto

Copie os diretórios:

```text
.cursor/
tasks/
agent-output/
```

para a raiz do seu projeto.

Exemplo:

```text
meu-projeto/
│
├── backend/
├── frontend/
│
├── .cursor/
├── tasks/
├── agent-output/
│
└── README.md
```

---

# 📝 2. Criando uma Tarefa

Todas as tarefas devem ser criadas utilizando arquivos Markdown.

Crie uma nova tarefa:

```text
tasks/backlog/TASK-001-cadastro-cliente.md
```

Exemplo:

```md
# TASK-001 - Cadastro de Cliente

## Descrição

Implementar funcionalidade para cadastro de clientes.

## Contexto

A aplicação precisa permitir o cadastro de novos clientes.

## Critérios de Aceite

- [ ] Deve permitir informar nome
- [ ] Deve permitir informar e-mail
- [ ] Deve permitir informar telefone
- [ ] O e-mail deve ser único
- [ ] Campos obrigatórios devem ser validados
- [ ] A funcionalidade deve possuir testes automatizados

## Impacto

Backend: SIM
Frontend: SIM
Banco de Dados: SIM

## Tipo

FEATURE

## Prioridade

HIGH

## Status

BACKLOG
```

---

# 🧠 3. Executando uma Tarefa

Abra o Cursor na raiz do projeto.

No Agent, informe:

```text
Execute a tarefa TASK-001 utilizando a arquitetura multi-agent definida no projeto.

Leia a tarefa:

tasks/backlog/TASK-001-cadastro-cliente.md

Siga os agentes, regras e workflows definidos em .cursor.

Não implemente diretamente antes de analisar a tarefa e criar o plano de execução.
```

O Orchestrator será responsável por iniciar o fluxo.

---

# 🔄 Fluxo de Execução

## Etapa 1 — Orchestrator

O Orchestrator deve:

1. Ler a tarefa
2. Analisar o escopo
3. Identificar impacto técnico
4. Criar plano de execução
5. Delegar atividades
6. Acompanhar resultados
7. Encaminhar para validação QA

Exemplo de decisão:

```text
TASK-001

Impacto identificado:

✓ Backend
✓ Frontend
✓ Banco de dados
✓ Testes
```

Plano:

```text
JAVA AGENT
├── Criar entidade Cliente
├── Criar Repository
├── Criar Service
├── Criar Controller
├── Criar Migration
└── Criar Testes

ANGULAR AGENT
├── Criar tela
├── Criar formulário
├── Criar Service HTTP
├── Criar validações
└── Criar Testes

QA AGENT
├── Validar critérios
├── Executar testes
├── Validar cenários
└── Gerar parecer
```

---

# ☕ Java Agent

O Java Agent deve trabalhar exclusivamente no contexto backend.

Exemplo de acionamento:

```text
Execute as responsabilidades de backend da TASK-001.

Escopo:

- Implementar cadastro de cliente
- Criar validações
- Garantir unicidade de e-mail
- Criar testes unitários
- Criar testes de integração quando necessário

Utilize Context7 MCP apenas caso seja necessário consultar documentação
de frameworks ou bibliotecas.

Não implemente funcionalidades de frontend.

Ao finalizar, gere o handoff estruturado.
```

---

# 🅰️ Angular Agent

O Angular Agent deve trabalhar exclusivamente no contexto frontend.

Exemplo:

```text
Execute as responsabilidades de frontend da TASK-001.

Escopo:

- Criar formulário
- Criar validações
- Integrar com API
- Criar testes
- Garantir tratamento de erros

Utilize Context7 MCP somente quando necessário para consultar
documentação do Angular ou bibliotecas relacionadas.

Não altere código backend.

Ao finalizar, gere o handoff estruturado.
```

---

# 🧪 QA Agent

Após a implementação, o QA Agent realiza a validação.

Exemplo:

```text
Valide a TASK-001.

Analise:

- Critérios de aceite
- Testes implementados
- Cobertura funcional
- Cenários positivos
- Cenários negativos
- Possíveis regressões

Utilize o Playwright MCP quando aplicável para validar
fluxos funcionais da interface.

Retorne apenas um dos seguintes resultados:

APPROVED

ou

CHANGES_REQUIRED
```

---

# 🔌 Configurando os MCPs no Cursor

Esta arquitetura utiliza dois MCPs principais:

1. Context7 MCP
2. Playwright MCP

O Cursor permite configurar MCPs globalmente ou por projeto.

A documentação oficial do Cursor explica que configurações podem ser colocadas globalmente em `~/.cursor/mcp.json` ou especificamente no projeto em `.cursor/mcp.json`. Configurações do projeto têm prioridade quando existe conflito.

---

# 📚 MCP 1 — Context7

O Context7 permite que os agentes consultem documentação atualizada de frameworks e bibliotecas.

Isso é especialmente útil para:

* Spring Boot
* Angular
* Java
* TypeScript
* JPA
* Hibernate
* RxJS
* bibliotecas externas
* APIs com versões recentes

A recomendação desta arquitetura é que o Context7 seja utilizado **sob demanda**, evitando consultas desnecessárias.

---

## Pré-requisito

É necessário possuir:

```text
Node.js 18+
```

---

## Configuração no Cursor

Crie o arquivo:

```text
.cursor/mcp.json
```

Caso ele já exista, adicione o servidor Context7.

```json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": [
        "-y",
        "@upstash/context7-mcp@latest"
      ]
    }
  }
}
```

O Context7 fornece integração para Cursor via MCP e pode ser configurado localmente com `npx` ou por conexão remota, dependendo da estratégia adotada.

---

## Context7 com API Key

Para maior controle e limites mais altos, utilize uma API Key:

```json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": [
        "-y",
        "@upstash/context7-mcp",
        "--api-key",
        "SUA_API_KEY"
      ]
    }
  }
}
```

### Recomendação

Não coloque API Keys diretamente no Git.

Prefira variáveis de ambiente quando possível.

Exemplo:

```json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": [
        "-y",
        "@upstash/context7-mcp",
        "--api-key",
        "${env:CONTEXT7_API_KEY}"
      ]
    }
  }
}
```

O Cursor suporta interpolação de variáveis de ambiente nas configurações MCP.

---

# 🎭 MCP 2 — Playwright

O Playwright MCP permite que agentes interajam com aplicações através do navegador.

Ele pode ser utilizado pelo QA Agent para:

* Navegar na aplicação
* Preencher formulários
* Clicar em elementos
* Validar fluxos
* Testar funcionalidades
* Validar cenários de aceitação
* Detectar problemas funcionais
* Executar validações de regressão

O Playwright MCP utiliza uma representação estruturada da página baseada na árvore de acessibilidade, o que é particularmente adequado para agentes e evita depender exclusivamente de screenshots.

---

## Configuração

Adicione ao `.cursor/mcp.json`:

```json
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": [
        "-y",
        "@playwright/mcp@latest"
      ]
    }
  }
}
```

A configuração oficial do Playwright MCP suporta Cursor utilizando o pacote `@playwright/mcp`.

---

# 🧩 Configuração Completa

A configuração recomendada para este projeto:

```json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": [
        "-y",
        "@upstash/context7-mcp@latest"
      ]
    },
    "playwright": {
      "command": "npx",
      "args": [
        "-y",
        "@playwright/mcp@latest"
      ]
    }
  }
}
```

Salve em:

```text
.cursor/mcp.json
```

---

# 🌐 MCP Global vs MCP por Projeto

Existem duas estratégias.

## MCP Global

Disponível para todos os projetos.

Localização:

```text
~/.cursor/mcp.json
```

Utilize quando:

* Você sempre utiliza os mesmos MCPs
* Context7 é utilizado em vários projetos
* Playwright é utilizado em vários projetos

---

## MCP por Projeto

Disponível apenas no projeto.

Localização:

```text
.cursor/mcp.json
```

Utilize quando:

* O projeto possui ferramentas específicas
* O time deve compartilhar a mesma configuração
* Existem MCPs exclusivos do projeto

### Recomendação para esta arquitetura

Utilizar:

```text
.cursor/mcp.json
```

Dessa forma, a configuração faz parte do projeto e pode ser versionada.

**Nunca versionar API Keys ou credenciais.**

---

# ⚙️ Como Verificar se os MCPs Estão Funcionando

No Cursor:

1. Abra o Cursor Settings
2. Acesse MCP / Tools & MCP
3. Verifique os servidores configurados
4. Confirme que estão ativos
5. Teste uma interação

Exemplo para Context7:

```text
Consulte o Context7 para verificar a documentação atual
do Spring Boot para validação de requests.
```

Exemplo para Playwright:

```text
Utilize Playwright MCP para abrir a aplicação local
e validar o fluxo de cadastro de cliente.
```

O Cursor também oferece instalação e gerenciamento de MCPs pela interface Customize/MCPs, além da configuração manual via `mcp.json`.

---

# 🧠 Estratégia de Uso do Context7

O Context7 **não deve ser utilizado automaticamente em todas as tarefas**.

A regra recomendada:

```text
Agente precisa implementar algo
            │
            ▼
Conhece a API?
            │
      ┌─────┴─────┐
      │           │
     SIM         NÃO
      │           │
      ▼           ▼
Implementa    Context7 MCP
                  │
                  ▼
           Consulta documentação
                  │
                  ▼
              Implementa
```

Utilize Context7 quando:

* Existe dúvida sobre API
* Framework possui versão recente
* Biblioteca mudou
* Sintaxe não é conhecida
* Configuração é complexa
* Existe risco de utilizar API depreciada

Não utilize quando:

* A implementação é simples
* O código já possui exemplos semelhantes
* A API já está claramente utilizada no projeto

Isso ajuda a reduzir chamadas desnecessárias e consumo de contexto.

---

# 💰 Otimização de Tokens

Esta arquitetura foi projetada para evitar o problema conhecido como:

```text
Context Explosion
```

Isso acontece quando todos os agentes recebem todo o contexto do projeto.

Exemplo ruim:

```text
Projeto completo
        │
        ▼
Orchestrator
        │
        ▼
100.000 tokens
        │
 ┌──────┼──────┐
 ▼      ▼      ▼
Java Angular QA
100k   100k    100k
```

Resultado:

```text
400.000+ tokens
```

---

## Estratégia utilizada

Cada agente recebe apenas o contexto necessário.

### Java Agent

```text
TASK
+
Critérios Backend
+
Arquivos Backend
+
Regras Java
```

### Angular Agent

```text
TASK
+
Critérios Frontend
+
Arquivos Frontend
+
Regras Angular
```

### QA Agent

```text
TASK
+
Critérios de Aceite
+
Handoff Java
+
Handoff Angular
+
Resultados dos Testes
```

---

# 🔄 Agent Handoff

Os agentes não devem transferir todo o histórico da conversa.

Eles devem produzir handoffs estruturados.

Exemplo:

```json
{
  "task": "TASK-001",
  "agent": "java-specialist",
  "status": "completed",
  "files_changed": [
    "Cliente.java",
    "ClienteService.java",
    "ClienteController.java"
  ],
  "tests": {
    "total": 12,
    "passed": 12,
    "failed": 0
  },
  "acceptance_criteria": [
    {
      "criterion": "Email único",
      "status": "implemented"
    }
  ],
  "pending": []
}
```

O próximo agente recebe esse resumo.

Ele não precisa receber:

```text
❌ Histórico completo
❌ Chain of thought
❌ Tentativas anteriores
❌ Toda documentação consultada
❌ Arquivos irrelevantes
```

---

# 🔐 Segurança

Nunca adicione ao Git:

```text
API Keys
Tokens
Senhas
Credenciais
Arquivos .env
```

Adicione ao `.gitignore`:

```gitignore
.env
.env.local
*.key
*.pem
```

Caso utilize variáveis de ambiente:

```text
CONTEXT7_API_KEY
```

configure-as localmente ou no ambiente de CI/CD.

---

# 🧪 Exemplo Completo de Execução

## 1. Criar tarefa

```text
tasks/backlog/TASK-001-cadastro-cliente.md
```

---

## 2. Abrir Cursor

Abra a raiz do projeto:

```text
meu-projeto/
```

---

## 3. Solicitar execução

```text
Execute a tarefa TASK-001 seguindo a arquitetura multi-agent.

Arquivo da tarefa:

tasks/backlog/TASK-001-cadastro-cliente.md

Workflow:

1. Orchestrator analisa
2. Java Agent executa backend
3. Angular Agent executa frontend
4. QA Agent valida
5. Playwright MCP executa validações funcionais quando aplicável

Utilize Context7 apenas quando necessário.

Utilize handoffs estruturados.

Evite carregar arquivos irrelevantes.

Não marque a tarefa como concluída sem aprovação do QA.
```

---

# 🔄 Fluxo de Status

```text
BACKLOG
   │
   ▼
IN_PROGRESS
   │
   ▼
IMPLEMENTATION_DONE
   │
   ▼
QA_VALIDATION
   │
   ├───────────────┐
   │               │
   ▼               ▼
APPROVED    CHANGES_REQUIRED
   │               │
   ▼               │
DONE ◄─────────────┘
```

---

# 📊 Definition of Done

Uma tarefa somente pode ser considerada concluída quando:

* [ ] Código implementado
* [ ] Critérios de aceite atendidos
* [ ] Testes automatizados executados
* [ ] Testes aprovados
* [ ] Build executado
* [ ] Linter executado quando aplicável
* [ ] QA Agent aprovou
* [ ] Handoff final registrado

---

# 🛠️ Workflows Disponíveis

A arquitetura pode trabalhar com diferentes tipos de tarefas.

## Feature

```text
BACKLOG
↓
ANALYSIS
↓
IMPLEMENTATION
↓
TESTING
↓
QA
↓
DONE
```

---

## Bugfix

```text
BUG IDENTIFICATION
↓
REPRODUCTION
↓
ROOT CAUSE ANALYSIS
↓
FIX
↓
REGRESSION TEST
↓
QA
↓
DONE
```

---

## Hotfix

```text
INCIDENT
↓
IMPACT ANALYSIS
↓
MINIMUM FIX
↓
CRITICAL TEST
↓
QA
↓
DEPLOY
```

---

# 🎯 Boas Práticas

## Faça

* Criar tarefas pequenas e claras
* Definir critérios de aceite
* Separar responsabilidades dos agentes
* Utilizar Context7 sob demanda
* Utilizar Playwright para validação funcional
* Utilizar handoffs estruturados
* Manter evidências dos testes
* Evitar contexto desnecessário

---

## Evite

* Passar o projeto inteiro para todos os agentes
* Permitir que todos alterem os mesmos arquivos
* Consultar MCPs sem necessidade
* Repetir análise da tarefa
* Transferir histórico completo entre agentes
* Marcar tarefas como concluídas sem QA
* Colocar credenciais no Git

---

# 🚀 Próximas Evoluções

Sugestões para evolução da arquitetura:

* Integração com GitHub Issues
* Criação automática de Pull Requests
* Integração com SonarQube
* Integração com CI/CD
* Métricas de qualidade
* Métricas de consumo de tokens
* Limite máximo de tentativas por agente
* Checkpoints automáticos
* Recuperação automática de falhas
* Memória estruturada por projeto
* Dashboard de execução de agentes

---

# 📚 Referências

* [Cursor MCP Documentation](https://prod.cursor.com/docs/mcp?utm_source=chatgpt.com)
* [Cursor MCP Integrations Guide](https://prod.cursor.com/help/customization/mcp?utm_source=chatgpt.com)
* [Context7 MCP Documentation](https://github.com/upstash/context7/blob/master/packages/mcp/README.md?utm_source=chatgpt.com)
* [Playwright MCP Documentation](https://github.com/microsoft/playwright/blob/main/docs/src/getting-started-mcp.md?utm_source=chatgpt.com)

---

# 📄 Licença

Defina a licença de acordo com a necessidade do projeto.

Sugestões:

* MIT
* Apache 2.0
* Proprietary

---

# ⭐ Conclusão

Esta arquitetura foi projetada para transformar o Cursor em um ambiente de desenvolvimento baseado em agentes especializados.

O principal objetivo não é apenas dividir tarefas entre múltiplos agentes.

A arquitetura busca:

```text
Menos contexto
        ↓
Menos tokens
        ↓
Menos duplicação
        ↓
Mais especialização
        ↓
Melhor qualidade
        ↓
Validação automatizada
```

Cada agente possui uma responsabilidade clara, recebe apenas o contexto necessário e produz resultados estruturados para o próximo estágio do workflow.

Dessa forma, é possível criar um processo mais previsível, escalável e eficiente para desenvolvimento assistido por IA.
