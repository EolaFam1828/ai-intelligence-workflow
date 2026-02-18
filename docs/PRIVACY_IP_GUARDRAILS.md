# Privacy and IP Guardrails

Verified against private codebase commit `cf855f6` on `2026-02-18`.

## Page Navigation

[![Prev](https://img.shields.io/badge/Prev-4B5563?style=for-the-badge)](./VISUAL-WALKTHROUGH-AUTHENTICATED.md)
[![Index](https://img.shields.io/badge/Index-111827?style=for-the-badge)](./INDEX.md)
[![Next](https://img.shields.io/badge/Next-2563EB?style=for-the-badge)](./PORTFOLIO_EXTRACTION_PLAYBOOK.md)
[![Home](https://img.shields.io/badge/Home-0F172A?style=for-the-badge)](../README.md)

Public-safe disclosure policy for architecture and operations evidence.

## 1. Data Classification Tiers

| Tier | Examples | Public Eligibility |
| --- | --- | --- |
| public | generalized architecture patterns, sanitized metrics | publishable |
| internal | non-sensitive operational notes, abstract runbook logic | publishable with review |
| sensitive | client identifiers, private schemas, internal dataset names | never publish |
| restricted | secrets, credentials, tokens, proprietary ranking heuristics | never publish |

## 2. Tenant Isolation Posture

- logical workspace isolation for all request and retrieval scope
- row-level data access controls keyed by workspace/tenant scope
- retrieval scope filters enforced before model invocation
- citation resolution gated to in-scope sources only

## 3. Secrets and Credential Handling

- credentials are loaded through environment variables or secret managers
- secrets are never persisted in run artifacts
- no secret values are logged in plaintext
- periodic rotation and immediate revocation policy for exposed credentials

## 4. Prompt and Logging Policy

Retained:

- request metadata (timestamps, run IDs, stage durations, model class)
- redacted prompt statistics (token counts, prompt class, redaction flags)
- validation and fallback outcomes

Redacted or not retained:

- direct client-identifying content
- private corpus identifiers
- raw prompts containing sensitive terms
- credential-like patterns

Retention window (public-safe summary):

- short-lived operational logs for incident triage
- longer-lived aggregate metrics for SLO reporting
- configurable deletion workflows for scoped tenant requests

## 5. Vendor Boundary Assumptions

- external model providers may process prompt payloads for inference
- provider-side retention controls are treated as a risk boundary, not a trust guarantee
- minimization controls are required before outbound prompts:
  - scope reduction
  - identifier redaction
  - bounded context windows
  - no secrets in prompts

## 6. Threat Model (Public-Safe)

| Threat | Abuse Path | Current Control |
| --- | --- | --- |
| prompt data leakage | sensitive identifiers reach model provider | pre-send redaction and context minimization |
| cross-tenant data bleed | retrieval returns out-of-scope source | workspace-scoped filters + citation-scope validation |
| secret disclosure in docs | accidental commit of credentials or tokens | sanity scanner + pre-commit + CI checks |
| private IP exposure | proprietary heuristic description leaks in docs | publication checklist and reviewer signoff |
| over-logging sensitive prompts | prompt body stored with identifiers | redaction policy + retention limits + structured logging |

## 7. Publication Rules

Always allowed:

- architecture diagrams
- control boundary descriptions
- sanitized case-study metrics with measurement method
- public-safe incident taxonomy and mitigation patterns

Never allowed:

- source files from private repo
- private endpoint/model/schema names
- client-identifying values or examples
- proprietary ranking/routing heuristics details
- secrets or credential-like strings

## 8. Pre-Publish Checklist

1. Run `./scripts/sanity_check_portfolio.sh .`.
2. Review generated diffs for sensitive terms and private identifiers.
3. Confirm all claims map to a public-safe measurement artifact.
4. Ensure screenshots and links resolve.
5. Publish only after reviewer signoff on privacy/IP boundaries.

## Continue

[![Prev](https://img.shields.io/badge/Prev-4B5563?style=for-the-badge)](./VISUAL-WALKTHROUGH-AUTHENTICATED.md)
[![Index](https://img.shields.io/badge/Index-111827?style=for-the-badge)](./INDEX.md)
[![Next](https://img.shields.io/badge/Next-2563EB?style=for-the-badge)](./PORTFOLIO_EXTRACTION_PLAYBOOK.md)
[![Home](https://img.shields.io/badge/Home-0F172A?style=for-the-badge)](../README.md)
