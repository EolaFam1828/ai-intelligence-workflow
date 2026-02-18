# Authenticated Visual Walkthrough

Verified against private codebase commit `cf855f6` on `2026-02-18`.

All images in this document are sanitized authenticated UI captures rendered from the private application with mocked auth and fixture data.

## Strategy Studio

![Sanitized Authenticated Strategy Module](../assets/screenshots/ui-module-strategy-auth-sanitized.png)

## Repository

![Sanitized Authenticated Repository Module](../assets/screenshots/ui-module-repository-auth-sanitized.png)

## Workflow Orchestrator

![Sanitized Authenticated Workflow Module](../assets/screenshots/ui-module-workflow-auth-sanitized.png)

## Module Surface Map

```mermaid
flowchart LR
    A["Authenticated Shell"] --> B["Strategy Studio"]
    A --> C["Repository"]
    A --> D["Workflow Orchestrator"]
    B --> E["Analysis Trigger + Version Surface"]
    C --> F["Document Pipeline + Retrieval Surface"]
    D --> G["Stage Timeline + Schedule Surface"]
```

## Capture Boundary

```mermaid
flowchart LR
    UI["Rendered UI Route"] --> API["Route-Scoped API Mocks"]
    API --> FIX["Synthetic Fixture Payloads"]
    FIX --> SAN["DOM Text Sanitization"]
    SAN --> IMG["Published Screenshot Asset"]
```
