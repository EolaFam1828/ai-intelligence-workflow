# Case Study: Reliability Upgrade for Intelligence Brief Generation

Verified against private codebase commit `cf855f6` on `2026-02-18`.

## Page Navigation

[![Prev](https://img.shields.io/badge/Prev-4B5563?style=for-the-badge)](./SKILLS-EVIDENCE-MATRIX.md)
[![Index](https://img.shields.io/badge/Index-111827?style=for-the-badge)](./INDEX.md)
[![Next](https://img.shields.io/badge/Next-2563EB?style=for-the-badge)](./CASE-STUDY-TEMPLATE.md)
[![Home](https://img.shields.io/badge/Home-0F172A?style=for-the-badge)](../README.md)

## 1. Snapshot

- title: reliability upgrade for intelligence brief generation pipeline
- timeframe: 2025-Q4 to 2026-Q1
- role: AI engineer and systems architect
- team: 1 product manager, 2 backend engineers, 1 frontend engineer, 1 designer
- problem type: low reliability and high manual cleanup for multi-stage LLM output

## 2. Problem

- affected users: internal analysts and operations reviewers
- baseline behavior: briefs frequently failed schema validation or timed out during peak load
- impact: delayed delivery, manual rework, inconsistent output quality

## 3. Constraints

- latency: p95 response target under 6 seconds
- quality: enforce structured output with strict schema checks
- cost: keep generation cost increase under 10%
- privacy/compliance: no client identifiers in prompts, logs, or exports
- integration: preserve existing API contract for frontend module consumers

## 4. Ownership

- architecture: designed orchestration flow with retrieval, routing, validation, and provenance stages
- implementation: built retry/fallback policy and schema-gated response normalization
- operations/telemetry: added stage-level timing and validation outcome metrics
- cross-functional coordination: aligned acceptance criteria across product, backend, and frontend

## 5. Design

- request routing: route requests by task class, complexity, and latency budget
- retrieval/context: retrieve bounded context window and normalize chunk metadata
- model strategy: primary provider with fallback model on timeout/error budget breach
- output contract: strict JSON schema validation with bounded corrective retry
- provenance: attach citation keys to retrieved source IDs and reject unresolved citations

## 6. Implementation Notes

- introduced stage timeouts and retry caps per orchestration stage
- added schema-repair retry path before user-visible failure
- persisted citation mapping metadata with each generated brief artifact

## 7. Outcomes

For each claim:
- metric: schema-valid response rate
- before: 81.8%
- after: 97.2%
- measurement method: 28-day rolling window from orchestration run logs (`valid_responses / total_responses`)
- limits: includes internal production traffic only, excludes sandbox tenants

- metric: timeout/failure rate
- before: 6.4%
- after: 1.5%
- measurement method: stage timeout + final failure events aggregated daily
- limits: measured after cache warm-up period, may vary with provider outages

- metric: analyst manual edit time per brief
- before: 23 minutes median
- after: 11 minutes median
- measurement method: sampled completion timestamps from internal review workflow
- limits: sample limited to top-3 recurring brief types

- metric: p95 end-to-end latency
- before: 9.1 seconds
- after: 5.7 seconds
- measurement method: API request timing from ingress to final response
- limits: excludes asynchronous enrichment jobs

## 8. Tradeoffs

- accepted tradeoff: slightly higher token usage to preserve citation coverage and schema reliability
- rejected alternative: single-model only path with no fallback because it failed latency/error goals
- next change: adaptive context trimming based on prompt size and model latency profile

## 9. Role Mapping

- AI Engineer: designed and implemented orchestration, schema validation, and citation checks
- Systems Architect: defined control boundaries, fallback behavior, and observability coverage
- Product/AI Specialist: translated analyst quality expectations into measurable acceptance criteria
- Domain Expert: reviewed output usefulness and citation confidence thresholds

## 10. Publication Check

- no confidential data
- no client-identifiable data
- no proprietary algorithm details
- no unverified claim

## Commit Checklist

- run `scripts/sanity_check_portfolio.sh`
- verify each claim source
- review diff for private terms

## Continue

[![Prev](https://img.shields.io/badge/Prev-4B5563?style=for-the-badge)](./SKILLS-EVIDENCE-MATRIX.md)
[![Index](https://img.shields.io/badge/Index-111827?style=for-the-badge)](./INDEX.md)
[![Next](https://img.shields.io/badge/Next-2563EB?style=for-the-badge)](./CASE-STUDY-TEMPLATE.md)
[![Home](https://img.shields.io/badge/Home-0F172A?style=for-the-badge)](../README.md)
