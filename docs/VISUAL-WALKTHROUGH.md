# Visual Walkthrough

Verified against private codebase commit `cf855f6` on `2026-02-18`.

All images in this document are sanitized render captures from the private application UI.

Authenticated module renders: [`docs/VISUAL-WALKTHROUGH-AUTHENTICATED.md`](VISUAL-WALKTHROUGH-AUTHENTICATED.md)

## Desktop View

![Sanitized Desktop UI](../assets/screenshots/ui-overview-desktop-sanitized.png)

## Mobile View

![Sanitized Mobile UI](../assets/screenshots/ui-overview-mobile-sanitized.png)

## UI Module Map

```mermaid
flowchart TD
    A["Workspace Home"] --> B["Strategy Studio"]
    A --> C["Data Review"]
    A --> D["Document Builder"]
    A --> E["Timeline"]
    A --> F["Reasoning Map"]
    A --> G["Source Triage"]
    A --> H["Deliverables"]
```

## Runtime Interaction Map

```mermaid
flowchart LR
    UI["UI Modules"] --> API["API Routes"]
    API --> ORCH["Orchestration Services"]
    ORCH --> DB["Persistence Layer"]
    ORCH --> AI["Model Providers"]
    DB --> UI
```
