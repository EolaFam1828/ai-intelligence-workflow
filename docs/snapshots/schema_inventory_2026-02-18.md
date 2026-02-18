# Redacted Schema Inventory: 2026-02-18

Source scope: private repository (name withheld)  
Snapshot date: `2026-02-18`

This table shows schema composition by category, not by private model names.

## Prisma Model Categories

| Model Category (Redacted) | Count |
| --- | --- |
| identity-and-access | 6 |
| workspace-and-tenancy | 7 |
| ingestion-and-documents | 8 |
| retrieval-and-indexing | 7 |
| orchestration-and-runs | 9 |
| deliverables-and-exports | 6 |
| observability-and-audit | 4 |
| billing-and-usage | 2 |
| **Total** | **49** |

## Migration Categories

| Migration Category (Redacted) | Count |
| --- | --- |
| core-schema | 7 |
| retrieval-pipeline | 5 |
| workflow-execution | 4 |
| security-controls | 3 |
| reporting-and-ops | 3 |
| **Total** | **22** |

## Derivation Notes

- Model totals were measured from `prisma/schema.prisma` using `^model` matches.
- Migration totals were measured from directory counts under `prisma/migrations`.
- Category names are normalized to preserve confidentiality while exposing scale and distribution.
