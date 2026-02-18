# SLOs and Failure Budgets

Verified against private codebase commit `cf855f6` on `2026-02-18`.

## Page Navigation

[![Prev](https://img.shields.io/badge/Prev-4B5563?style=for-the-badge)](./PROVING-GROUNDS.md)
[![Index](https://img.shields.io/badge/Index-111827?style=for-the-badge)](./INDEX.md)
[![Next](https://img.shields.io/badge/Next-2563EB?style=for-the-badge)](./SKILLS-EVIDENCE-MATRIX.md)
[![Home](https://img.shields.io/badge/Home-0F172A?style=for-the-badge)](../README.md)

Public-safe reliability objectives and operational policies for the synchronous orchestration path.

## Service Level Objectives

| SLI | Target | Window | Notes |
| --- | --- | --- | --- |
| p95 synchronous latency | `<= 6.0s` | rolling 28 days | ingress to final response, excludes async enrichment |
| schema-valid output rate | `>= 97.0%` | rolling 28 days | post-validation pass rate |
| citation resolution rate | `>= 99.0%` | rolling 28 days | no unresolved or out-of-scope citation keys |
| contract rejection accuracy | `>= 99.5%` deterministic reason coding | rolling 28 days | no ambiguous edge rejections |

## Error Budget Policy

| SLO Breach Signal | Budget Response | Operator Action |
| --- | --- | --- |
| latency burn rate `> 2.0x` for 1h | reduce expensive retrieval fanout | switch to low-latency retrieval profile |
| schema-valid rate below `97%` | increase validation strictness and repair prompts | freeze risky prompt template changes |
| citation resolution below `99%` | harden citation gate, disable low-confidence output paths | route incidents to provenance runbook |
| provider timeout spike | enforce fallback routing and tighter stage timeouts | activate provider suppression window |

## Degradation Ladder

1. reduce context window while preserving source diversity floor
2. disable non-critical enrichment sections
3. shift to fallback model tier with stricter timeout limits
4. return typed partial output only when contract guarantees still hold

## Incident Runbook Outlines

| Incident Class | Detection Signal | Immediate Mitigation | Prevention Follow-Up |
| --- | --- | --- | --- |
| schema-invalid generation | `orchestrator.validation.pass_rate` drop | enable strict repair template and rollback recent prompt change | add regression fixtures for failed shape |
| provider instability | `orchestrator.timeout.rate` increase | activate fallback provider route | tune circuit suppression thresholds |
| unresolved citations | `orchestrator.citation.unresolved` non-zero | block persistence and alert on run class | tighten citation mapping parser tests |
| duplicate async processing | job dedupe conflict metrics | force idempotency key path | add queue retry jitter and terminal poison rules |

## Reporting Cadence

- Daily: SLI dashboard and anomaly scan
- Weekly: budget burn review with product and engineering
- Monthly: SLO target reassessment and threshold calibration

## Continue

[![Prev](https://img.shields.io/badge/Prev-4B5563?style=for-the-badge)](./PROVING-GROUNDS.md)
[![Index](https://img.shields.io/badge/Index-111827?style=for-the-badge)](./INDEX.md)
[![Next](https://img.shields.io/badge/Next-2563EB?style=for-the-badge)](./SKILLS-EVIDENCE-MATRIX.md)
[![Home](https://img.shields.io/badge/Home-0F172A?style=for-the-badge)](../README.md)
