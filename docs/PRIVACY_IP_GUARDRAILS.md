# Privacy and IP Guardrails

Verified against private codebase commit `cf855f6` on `2026-02-18`.

## Rules

1. Do not publish client-identifying details.
2. Do not publish confidential workflow details.
3. Do not publish private repository source code.
4. Do not publish proprietary heuristics or internal schemas.
5. Do not publish unverified claims.

## Allowed Content

- architecture diagrams
- component responsibilities
- reliability/observability controls
- sanitized metrics with measurement method
- tradeoff notes without private implementation detail

## Redaction Rules

- replace domain terms with neutral technical terms
- replace private resource names with generic names
- remove identifiers, IDs, tokens, and exact data signatures

## Claim Requirements

Each claim includes:
- ownership scope
- implementation summary
- measurement method
- limits

## Pre-Publish Checklist

- run `scripts/sanity_check_portfolio.sh`
- install pre-commit automation with `scripts/install_git_hooks.sh`
- confirm CI workflow `.github/workflows/sanity-check.yml` passes
- inspect diff for private terms or identifiers
- remove unverifiable statements
