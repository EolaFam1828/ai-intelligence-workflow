# Privacy and IP Guardrails

These guardrails keep this portfolio truthful, useful, and safe to publish.

## Non-Negotiable Rules

1. No client-identifying details
- no names, identifiers, or data signatures that could reveal source context

2. No confidential workflow specifics
- no private operational procedures
- no internal-only process details

3. No proprietary implementation leakage
- no copy/paste source from private repositories
- no publication of secret heuristics or ranking formulas

4. No unverified claims
- every published achievement must be evidence-backed

## Allowed Public Content

- architecture abstractions
- component boundaries and responsibilities
- reliability and observability patterns
- sanitized before/after metrics
- lessons learned and tradeoff analysis

## Redaction Guidelines

Replace:
- domain-specific nouns with neutral workflow terms
- private table/index names with generic resource names
- specific partner/provider details with capability classes

Keep:
- technical reasoning
- decision tradeoffs
- measurable outcomes (if verified)

## Claim Validation Standard

Every major claim should answer:
- what changed?
- how was it measured?
- what was my contribution?
- what are the limits of the claim?

If any answer is missing, downgrade or remove the claim.

## Publication Checklist

Before each push:
- run `scripts/sanity_check_portfolio.sh`
- manually review diff for private or domain-specific leakage
- ensure new statements are evidence-backed
- confirm wording remains domain-neutral and recruiter-readable
