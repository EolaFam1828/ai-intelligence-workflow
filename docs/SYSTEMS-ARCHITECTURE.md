# System Architecture

Verified against private codebase commit `cf855f6` on `2026-02-18`.

## Runtime Topology

```mermaid
flowchart TB
    UI["React Frontend"] --> API["Express API Layer"]
    API --> ORCH["Orchestration Services"]
    ORCH --> LLM["LLM Providers (Primary + Fallback)"]
    ORCH --> RET["Retrieval + Context Assembly"]
    ORCH --> VAL["Schema Validation"]
    ORCH --> PROV["Provenance + Citation Layer"]
    API --> DB["PostgreSQL + Prisma"]
    API --> QUEUE["Async Job Queue"]
    QUEUE --> WORKERS["Background Workers"]
    WORKERS --> DB
    ORCH --> OBS["Logs / Metrics / Traces"]
    WORKERS --> OBS
```

## Synchronous Request Path

```mermaid
sequenceDiagram
    participant C as Client
    participant A as API
    participant O as Orchestrator
    participant R as Retrieval
    participant M as Model Router
    participant L as LLM
    participant V as Validator
    participant P as Provenance
    participant D as Database

    C->>A: request
    A->>O: normalized input
    O->>R: retrieve context
    R-->>O: ranked context
    O->>M: select model
    M-->>O: model choice
    O->>L: generate output
    L-->>O: raw output
    O->>V: schema validation
    V-->>O: valid/invalid
    O->>P: attach citation metadata
    O->>D: persist artifact + run metadata
    O-->>A: response payload
    A-->>C: response
```

## Asynchronous Processing Path

```mermaid
flowchart LR
    U["User Upload / Trigger"] --> X["API Endpoint"]
    X --> J["Create Job Record"]
    J --> Q["Queue Publish"]
    Q --> W["Worker Pull"]
    W --> S["Processing Stage Pipeline"]
    S --> C["Context + Analysis Updates"]
    C --> R["Recalibration Signals"]
    R --> P["Persistence"]
    P --> T["Telemetry"]
```

## Control Boundaries

| Boundary | Enforced By |
| --- | --- |
| request contract | endpoint validation + typed DTOs |
| generation contract | schema validation gate |
| retrieval scope | scoped query filters |
| model fallback | provider routing logic |
| export safety | provenance/citation checks |
| operational visibility | logs + metrics + trace events |

## Current Build Snapshot

| Area | Count |
| --- | --- |
| frontend routes | 24 |
| sidebar modules | 13 |
| backend route files | 25 |
| backend route handlers | 151 |
| service files | 37 |
| prisma models | 49 |
| prisma migrations | 22 |
| frontend components | 87 |

## Disclosure Boundaries

- omit private corpus details
- omit proprietary ranking/routing heuristics
- omit private schemas and identifiers
- omit private repository source code
