# Skills Evidence Matrix

Verified against private codebase commit `cf855f6` on `2026-02-18`.

## Page Navigation

[![Prev](https://img.shields.io/badge/Prev-4B5563?style=for-the-badge)](./SLOS-AND-FAILURE-BUDGETS.md)
[![Index](https://img.shields.io/badge/Index-111827?style=for-the-badge)](./INDEX.md)
[![Next](https://img.shields.io/badge/Next-2563EB?style=for-the-badge)](./CASE-STUDY-INTELLIGENCE-BRIEF.md)
[![Home](https://img.shields.io/badge/Home-0F172A?style=for-the-badge)](../README.md)

## Capability Mapping

| Capability | Artifact | Evidence Check |
| --- | --- | --- |
| AI orchestration topology | `docs/SYSTEMS-ARCHITECTURE.md` | synchronous + asynchronous stage flow documented |
| Contract-first API design | `docs/REQUEST_CONTRACTS_AND_SCHEMAS.md`, `docs/PROVING-GROUNDS.md` | DTO constraints and reject behavior documented |
| Structured output enforcement | `docs/REQUEST_CONTRACTS_AND_SCHEMAS.md` | schema contract and validator matrix documented |
| Provenance integrity | `docs/REQUEST_CONTRACTS_AND_SCHEMAS.md`, `docs/PROVING-GROUNDS.md` | citation map and scope-lock controls documented |
| Reliability operations | `docs/PROVING-GROUNDS.md`, `docs/SLOS-AND-FAILURE-BUDGETS.md` | incident taxonomy and error-budget policy documented |
| Architecture currency checks | `docs/ARCHITECTURE-DRIFT-CHECK.md`, `docs/LEGACY_CLAIMS_PUBLIC.md` | stale claims tracked against current snapshot |
| Privacy/IP governance | `docs/PRIVACY_IP_GUARDRAILS.md` | data handling and threat model boundaries documented |
| Delivery outcomes | case studies in `docs/CASE-STUDY-*.md` | quantified outcomes with measurement methods |
| Public verification discipline | `docs/snapshots/README.md` and dated snapshot files | command log and redacted inventories published |

## Provenance Implementation (Sanitized)

- retrieval emits normalized context chunks with `source_id` and scope metadata
- prompt assembly injects citation placeholders (`[C1]`, `[C2]`) bound to `source_id` values
- generation output is normalized into a citation map `{citation_key -> source_id}`
- persistence rejects output when any citation key is unresolved or out of scope
- run artifacts store output text, citation map, and retrieval IDs together for auditability

## Claim Format

Each claim should include:

- ownership scope
- implementation method
- verification method
- known limits

## Continue

[![Prev](https://img.shields.io/badge/Prev-4B5563?style=for-the-badge)](./SLOS-AND-FAILURE-BUDGETS.md)
[![Index](https://img.shields.io/badge/Index-111827?style=for-the-badge)](./INDEX.md)
[![Next](https://img.shields.io/badge/Next-2563EB?style=for-the-badge)](./CASE-STUDY-INTELLIGENCE-BRIEF.md)
[![Home](https://img.shields.io/badge/Home-0F172A?style=for-the-badge)](../README.md)
