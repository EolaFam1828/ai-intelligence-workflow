# Proving Grounds

Verified against private codebase commit `cf855f6` on `2026-02-18`.

## Page Navigation

[![Prev](https://img.shields.io/badge/Prev-4B5563?style=for-the-badge)](./REQUEST_CONTRACTS_AND_SCHEMAS.md)
[![Index](https://img.shields.io/badge/Index-111827?style=for-the-badge)](./INDEX.md)
[![Next](https://img.shields.io/badge/Next-2563EB?style=for-the-badge)](./SLOS-AND-FAILURE-BUDGETS.md)
[![Home](https://img.shields.io/badge/Home-0F172A?style=for-the-badge)](../README.md)

Public-safe operational details that demonstrate real system behavior without exposing private source code or proprietary data.

## 1. Edge Contract

| Field | Type | Bound | Reject Reason |
| --- | --- | --- | --- |
| `requestId` | string (UUID) | required | invalid request identifier |
| `workspaceId` | string | required + authorized scope | unauthorized scope |
| `mode` | enum | allowed set only | unsupported task mode |
| `query` | string | max length constraint | payload too large |
| `contextBudget.maxSources` | integer | `1..20` | out-of-range budget |
| `contextBudget.maxTokens` | integer | `512..12000` | out-of-range token budget |
| `includeCitations` | boolean | required | malformed contract |

Behavior:

- edge-contract failures return deterministic typed errors
- invalid contracts never trigger model calls
- rejection events are logged with redacted reason codes

## 2. Persistence Contract

| Artifact | Stored | Rationale |
| --- | --- | --- |
| run ID, timestamps, task mode | yes | traceability and incident reconstruction |
| model/provider class metadata | yes | fallback and reliability analysis |
| citation map (`citation_key -> source_id`) | yes | provenance auditability |
| validation outcomes and retry path | yes | reliability tuning |
| stage-level timings | yes | latency SLO management |
| raw private source documents | no | confidentiality boundary |
| credentials/secrets/tokens | no | security boundary |
| proprietary ranking internals | no | IP boundary |
| unredacted sensitive prompt bodies | no | privacy boundary |

Immutability posture:

- completed run identifiers and citation mappings are append-only
- corrections create new run events; prior artifacts are not overwritten

## 3. Telemetry Contract

| Metric | Purpose | Trigger |
| --- | --- | --- |
| `orchestrator.stage.duration_ms` | identify latency hotspots | stage exceeds budget |
| `orchestrator.validation.pass_rate` | detect schema regressions | pass rate below threshold |
| `orchestrator.fallback.invocations` | track provider instability | fallback spike |
| `orchestrator.timeout.rate` | detect timeout cascades | timeout burn-rate alert |
| `orchestrator.citation.unresolved` | enforce provenance integrity | non-zero unresolved citations |
| `api.contract.reject.count` | monitor edge contract quality | reject ratio anomaly |

SLO targets and burn policy: [`docs/SLOS-AND-FAILURE-BUDGETS.md`](./SLOS-AND-FAILURE-BUDGETS.md)

## 4. Incident Taxonomy

| Symptom | Detection Signal | Mitigation | Prevention |
| --- | --- | --- | --- |
| schema-invalid model output | drop in validation pass rate | strict schema gate + bounded repair retry | add regression fixtures for failing output shapes |
| provider timeout / transient 5xx | timeout-rate spike | fallback provider route + suppression window | tune stage timeout budgets and circuit thresholds |
| low-signal retrieval context | relevance floor violation | scoped retrieval filters + empty-context guard path | ranking-quality eval and threshold recalibration |
| unresolved citation keys | citation unresolved counter | hard reject before persistence | strengthen citation parser and key mapping tests |
| duplicate async processing | dedupe conflict metrics | idempotency keys + worker dedupe gate | queue retry jitter + poison terminal rules |

## 5. Guardrail Boundaries

- no private corpus identifiers
- no private endpoint/model/schema names
- no proprietary heuristics formulae
- no publishable claim without a public-safe measurement source

## Continue

[![Prev](https://img.shields.io/badge/Prev-4B5563?style=for-the-badge)](./REQUEST_CONTRACTS_AND_SCHEMAS.md)
[![Index](https://img.shields.io/badge/Index-111827?style=for-the-badge)](./INDEX.md)
[![Next](https://img.shields.io/badge/Next-2563EB?style=for-the-badge)](./SLOS-AND-FAILURE-BUDGETS.md)
[![Home](https://img.shields.io/badge/Home-0F172A?style=for-the-badge)](../README.md)
