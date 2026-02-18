# Case Study: Retrieval Quality Improvement for Citation-Backed Outputs

Verified against private codebase commit `cf855f6` on `2026-02-18`.

## Page Navigation

[![Prev](https://img.shields.io/badge/Prev-4B5563?style=for-the-badge)](./CASE-STUDY-INTELLIGENCE-BRIEF.md)
[![Index](https://img.shields.io/badge/Index-111827?style=for-the-badge)](./INDEX.md)
[![Next](https://img.shields.io/badge/Next-2563EB?style=for-the-badge)](./CASE-STUDY-COST-RESILIENCE.md)
[![Home](https://img.shields.io/badge/Home-0F172A?style=for-the-badge)](../README.md)

## 1. Snapshot

- title: retrieval quality improvement for citation-backed brief generation
- timeframe: 2025-Q3 to 2025-Q4
- role: AI engineer (retrieval + evaluation owner)
- team: 1 product manager, 1 search engineer, 1 backend engineer
- problem type: low-signal retrieval caused weak evidence quality and citation churn

## 2. Problem

- affected users: analysts consuming generated briefs with source links
- baseline behavior: retrieval often returned broad but low-relevance context chunks
- impact: manual source replacement and lower trust in generated citations

## 3. Constraints

- latency: retrieval stage budget must remain under 900ms p95
- quality: improve evidence relevance without reducing coverage
- cost: avoid major embedding/index cost expansion
- privacy/compliance: preserve tenant-scoped retrieval boundaries
- integration: no API contract changes for frontend consumers

## 4. Ownership

- architecture: redesigned retrieval candidate pipeline with scoped filtering and reranking
- implementation: introduced normalized metadata scoring and min-relevance threshold path
- operations/telemetry: added retrieval precision proxy and citation correction counters
- cross-functional coordination: aligned quality rubric with analyst reviewers

## 5. Design

- request routing: retrieval strategy selected by task mode and context budget
- retrieval/context: two-phase retrieval (candidate gather, bounded rerank)
- model strategy: generation model unchanged to isolate retrieval effect
- output contract: citation gate preserved; unresolved keys remain hard failures
- provenance: source IDs enriched with retrieval confidence bands

## 6. Implementation Notes

- added retrieval candidate dedupe and scope hard filters
- introduced rerank threshold and empty-context safeguard path
- instrumented analyst correction events for feedback loop metrics

## 7. Outcomes

For each claim:

- metric: citation precision proxy (`accepted citations / cited sources`)
- before: 72.1%
- after: 91.4%
- measurement method: reviewer acceptance labels sampled from 21-day rolling window
- limits: proxy metric, not full IR benchmark

- metric: top-5 context relevance acceptance
- before: 63.0%
- after: 88.3%
- measurement method: blinded reviewer scoring on stratified request sample
- limits: weekly sample of high-volume workflow classes only

- metric: manual source swaps per brief
- before: 4.1 median
- after: 1.3 median
- measurement method: post-generation edit logs in review workflow
- limits: excludes briefs with manually added external sources

- metric: retrieval stage p95 latency
- before: 1.12s
- after: 0.84s
- measurement method: stage timer from orchestrator telemetry
- limits: measured after index warmup completion

## 8. Tradeoffs

- accepted tradeoff: stricter relevance floors reduce long-tail recall in rare edge prompts
- rejected alternative: unbounded top-k expansion due latency and noise inflation
- next change: dynamic thresholding by task mode and query entropy

## 9. Role Mapping

- AI Engineer: retrieval strategy design, rerank logic, and instrumentation
- Systems Architect: scope boundary and provenance contract alignment
- Product/AI Specialist: quality rubric definition and acceptance thresholds
- Domain Expert: source usefulness calibration and false-positive review

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

[![Prev](https://img.shields.io/badge/Prev-4B5563?style=for-the-badge)](./CASE-STUDY-INTELLIGENCE-BRIEF.md)
[![Index](https://img.shields.io/badge/Index-111827?style=for-the-badge)](./INDEX.md)
[![Next](https://img.shields.io/badge/Next-2563EB?style=for-the-badge)](./CASE-STUDY-COST-RESILIENCE.md)
[![Home](https://img.shields.io/badge/Home-0F172A?style=for-the-badge)](../README.md)
