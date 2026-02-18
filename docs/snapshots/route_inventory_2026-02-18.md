# Redacted Route Inventory: 2026-02-18

Source scope: private repository (name withheld)  
Snapshot date: `2026-02-18`

This table shows route family distribution without exposing private endpoint names.

| Route Family (Redacted) | Route Files | Route Handlers |
| --- | --- | --- |
| identity-and-auth | 2 | 11 |
| workspace-scoping | 3 | 18 |
| documents-and-ingestion | 3 | 20 |
| analysis-jobs | 2 | 16 |
| orchestration-control | 2 | 15 |
| retrieval-and-search | 2 | 12 |
| deliverables-and-export | 2 | 14 |
| notifications | 1 | 7 |
| administration | 2 | 11 |
| usage-and-billing | 1 | 6 |
| integrations | 2 | 9 |
| observability | 2 | 9 |
| health-and-readiness | 1 | 3 |
| **Total** | **25** | **151** |

## Derivation Notes

- Each row is a route-family grouping across `server/src/routes`.
- Counts come from handler discovery via `router.get/post/put/patch/delete` patterns.
- Family labels are intentionally generic and not one-to-one with private module names.
