# Visual Walkthrough

Verified against private codebase commit `cf855f6` on `2026-02-18`.

## Page Navigation

[![Prev](https://img.shields.io/badge/Prev-4B5563?style=for-the-badge)](./ARCHITECTURE-DRIFT-CHECK.md)
[![Index](https://img.shields.io/badge/Index-111827?style=for-the-badge)](./INDEX.md)
[![Next](https://img.shields.io/badge/Next-2563EB?style=for-the-badge)](./VISUAL-WALKTHROUGH-AUTHENTICATED.md)
[![Home](https://img.shields.io/badge/Home-0F172A?style=for-the-badge)](../README.md)

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

## Continue

[![Prev](https://img.shields.io/badge/Prev-4B5563?style=for-the-badge)](./ARCHITECTURE-DRIFT-CHECK.md)
[![Index](https://img.shields.io/badge/Index-111827?style=for-the-badge)](./INDEX.md)
[![Next](https://img.shields.io/badge/Next-2563EB?style=for-the-badge)](./VISUAL-WALKTHROUGH-AUTHENTICATED.md)
[![Home](https://img.shields.io/badge/Home-0F172A?style=for-the-badge)](../README.md)
