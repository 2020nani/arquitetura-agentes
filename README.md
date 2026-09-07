# Cursor Multi-Agent MCP - Arquitetura Robusta

Orquestração de tarefas por arquivos Markdown, com agentes especializados para **Java**, **Angular**, **QA/Validação** e **Tech Lead/Orquestrador**.

## Agentes

1. **Tech Lead / Orchestrator** (`orchestrator.md`)
   - Lê e valida a tarefa.
   - Quebra o escopo em subtarefas.
   - Define dependências e critérios de aceite.
   - Direciona para Java, Angular ou ambos.
   - Consolida resultados e decide o próximo estado.

2. **Java Specialist** (`java-agent.md`)
   - Implementa backend.
   - Usa **Context7 MCP** quando precisar consultar documentação/API/framework.
   - Executa testes locais e registra evidências.

3. **Angular Specialist** (`angular-agent.md`)
   - Implementa frontend.
   - Usa **Context7 MCP** quando precisar consultar documentação/API/framework.
   - Executa testes/lint/build e registra evidências.

4. **QA / Test Validation Agent** (`qa-agent.md`)
   - Valida critérios de aceite e estratégia de testes.
   - Usa **Paywriter MCP** para validação da tarefa e dos testes.
   - Reprova tarefas com evidências insuficientes.

## Fluxo

`BACKLOG -> TRIAGE -> IMPLEMENTATION -> SELF-TEST -> QA/PAYWRITER VALIDATION -> REVIEW -> DONE`

Estados físicos:
- `tasks/backlog`
- `tasks/in-progress`
- `tasks/review`
- `tasks/done`
- `tasks/failed`

## Como criar uma tarefa

Copie `templates/task-template.md` para `tasks/backlog/NNN-nome-da-tarefa.md`.

A tarefa é a fonte de verdade. Cada agente deve atualizar a seção **Execution Log** e **Evidence** sem apagar o histórico.

## MCPs

### Context7
Obrigatório para os agentes Java e Angular **quando houver necessidade de confirmar documentação, APIs, versões, padrões ou comportamento de bibliotecas**.

### Paywriter
Obrigatório no estágio de QA para validar:
- critérios de aceite;
- cobertura e qualidade dos testes;
- cenários positivos/negativos;
- regressões;
- aderência entre implementação e tarefa.

> Ajuste os nomes/comandos reais dos MCPs conforme a configuração instalada no seu Cursor.
