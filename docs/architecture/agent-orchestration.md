# Arquitetura de Orquestração

```text
                    ┌──────────────────────┐
                    │   TASK (.md)         │
                    │   Source of Truth    │
                    └──────────┬───────────┘
                               │
                    ┌──────────▼───────────┐
                    │ ORCHESTRATOR / TL    │
                    │ triage + delegation  │
                    └───────┬───────┬──────┘
                            │       │
              ┌─────────────▼─┐   ┌─▼──────────────┐
              │ JAVA AGENT    │   │ ANGULAR AGENT  │
              │ Context7 MCP  │   │ Context7 MCP   │
              └──────┬────────┘   └────────┬───────┘
                     └──────────┬──────────┘
                                │
                     ┌──────────▼──────────┐
                     │ QA / TEST VALIDATOR │
                     │ Paywriter MCP       │
                     └──────────┬──────────┘
                                │
                      APPROVED / RETURN
                                │
                     ┌──────────▼──────────┐
                     │ DONE / IN-PROGRESS  │
                     └─────────────────────┘
```
