# Skills Evidence Matrix

## Capability Mapping

| Capability | Artifact | Evidence Check |
| --- | --- | --- |
| AI orchestration | `docs/SYSTEMS-ARCHITECTURE.md` | routing + stage flow documented |
| Retrieval design | `docs/SYSTEMS-ARCHITECTURE.md` | retrieval + context stages documented |
| Structured outputs | `docs/SYSTEMS-ARCHITECTURE.md` | schema validation gate documented |
| Reliability controls | `docs/SYSTEMS-ARCHITECTURE.md` | timeout/retry/fallback controls documented |
| Provenance | `docs/SYSTEMS-ARCHITECTURE.md` | source metadata path documented |
| Privacy/IP controls | `docs/PRIVACY_IP_GUARDRAILS.md` | publication boundaries documented |
| Delivery outcomes | case studies using `docs/CASE-STUDY-TEMPLATE.md` | claims include before/after + method |

## Role Review Map

| Role | Review Questions | Primary Files |
| --- | --- | --- |
| AI Engineer | How are routing, retrieval, validation, and fallback handled? | `docs/SYSTEMS-ARCHITECTURE.md` |
| Systems Architect | Are boundaries and failure paths explicit? | `docs/SYSTEMS-ARCHITECTURE.md` |
| Product/AI Specialist | Are outcomes measurable and scoped? | case studies using `docs/CASE-STUDY-TEMPLATE.md` |
| Domain Expert | Is output traceable and publication-safe? | `docs/SYSTEMS-ARCHITECTURE.md`, `docs/PRIVACY_IP_GUARDRAILS.md` |

## Claim Format

Each claim should include:
- ownership scope
- implementation method
- verification method
- known limits
