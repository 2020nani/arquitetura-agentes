# Feature Workflow

1. Criar tarefa em `tasks/backlog`.
2. Orchestrator faz triagem e move para `in-progress`.
3. Orchestrator define subtarefas e agentes.
4. Java Agent executa backend, se aplicável.
5. Angular Agent executa frontend, se aplicável.
6. Cada agente registra evidências e testes.
7. QA Agent executa validação usando Paywriter MCP.
8. Se aprovado, Orchestrator consolida e move para `done`.
9. Se reprovado, retorna para `in-progress` com ações corretivas.
