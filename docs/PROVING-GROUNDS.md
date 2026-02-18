# Proving Grounds

Verified against private codebase commit `cf855f6` on `2026-02-18`.

Public-safe operational details that demonstrate real system behavior without exposing private source code or proprietary data.

## 1. Request Contract and Edge Rejection

All requests are normalized at the API edge before orchestration.

Accepted contract shape:
- typed DTO fields only
- bounded payload sizes
- scoped tenant/workspace identifiers
- explicitly enumerated task modes

Rejected at the edge:
- schema-invalid payloads
- unsupported task modes
- context requests outside authorized scope
- payloads above configured size/token budgets
- requests missing provenance-required metadata

Return behavior:
- deterministic error codes for validation failures
- no fallback execution for invalid edge contracts
- rejection events logged with redacted reason codes

## 2. Persistence Model (What Is Stored vs Not Stored)

Stored per run:
- request envelope metadata (timestamps, run ID, task mode, redacted tenant scope)
- selected model/provider metadata (not provider secrets)
- retrieval source references (`source_id` + citation key mapping)
- validation outcomes and retry/fallback path metadata
- final structured output artifact
- stage timing metrics

Deliberately not stored:
- raw private source documents
- secrets/tokens/credentials
- full unredacted prompts containing sensitive domain terms
- proprietary ranking feature internals
- user-entered identifiers flagged by redaction rules

Immutability posture:
- run IDs and citation mappings are append-only after completion
- corrective actions generate new run events rather than mutating prior records

## 3. Telemetry and the Questions It Answers

Core telemetry signals:
- `orchestrator.stage.duration_ms`
- `orchestrator.validation.pass_rate`
- `orchestrator.fallback.invocations`
- `orchestrator.timeout.rate`
- `orchestrator.citation.unresolved`
- `api.contract.reject.count`

Questions this telemetry answers:
- where latency is accumulating by stage
- whether output validity is improving or regressing
- when fallback usage indicates provider instability
- whether citation integrity is breaking under load
- which request classes are failing contract checks

## 4. Incident Classes and Mitigations

Top recurring incident classes and current mitigations:

1. Schema-invalid model output
- mitigation: strict schema gate + bounded repair retry + typed default fallbacks

2. Provider timeout or transient 5xx
- mitigation: per-stage timeout budget + fallback provider routing + circuit-break style suppression window

3. Retrieval returns low-signal context
- mitigation: scoped retrieval filters + minimum relevance threshold + empty-context guard path

4. Unresolved citation keys in generated output
- mitigation: citation map validation before persistence + hard reject on unresolved key + alert counter

5. Duplicate async processing from retried jobs
- mitigation: idempotency keys on enqueue + worker-side dedupe check + terminal poison-queue state for repeated failure

## 5. Guardrail Boundaries

- no private corpus identifiers
- no proprietary heuristics formulae
- no private schema internals
- no publishable claim without measurement source
