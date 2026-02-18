# Portfolio Extraction Playbook

Verified against private codebase commit `cf855f6` on `2026-02-18`.

## Page Navigation

[![Prev](https://img.shields.io/badge/Prev-4B5563?style=for-the-badge)](./PRIVACY_IP_GUARDRAILS.md)
[![Index](https://img.shields.io/badge/Index-111827?style=for-the-badge)](./INDEX.md)
[![Next](https://img.shields.io/badge/Next-2563EB?style=for-the-badge)](./INDEX.md)
[![Home](https://img.shields.io/badge/Home-0F172A?style=for-the-badge)](../README.md)

## Goal

Convert private project work into public documentation without disclosing private code, identifiers, or proprietary logic.

## Steps

1. Inventory artifacts in the private repo.
- architecture notes
- operating patterns
- incidents/fixes
- measurable outcomes

2. Classify each artifact.
- `public-safe`
- `public-safe-with-redaction`
- `private-only`

3. Rewrite to neutral terms.
- replace domain terms with technical terms
- remove private identifiers

4. Publish patterns only.
- architecture diagrams
- workflow descriptions
- reliability controls
- outcome summaries

5. Do not publish:
- source files from private repo
- proprietary heuristics
- private schemas

6. Draft case studies with `docs/CASE-STUDY-TEMPLATE.md`.

7. Run checks before each publish.
- `scripts/sanity_check_portfolio.sh`
- `.githooks/pre-commit` (after `scripts/install_git_hooks.sh`)
- `.github/workflows/sanity-check.yml` on PR/push
- manual diff review for disclosure

8. Keep updates incremental.
- add or revise one artifact at a time
- remove weak or unverifiable claims

## Continue

[![Prev](https://img.shields.io/badge/Prev-4B5563?style=for-the-badge)](./PRIVACY_IP_GUARDRAILS.md)
[![Index](https://img.shields.io/badge/Index-111827?style=for-the-badge)](./INDEX.md)
[![Next](https://img.shields.io/badge/Next-2563EB?style=for-the-badge)](./INDEX.md)
[![Home](https://img.shields.io/badge/Home-0F172A?style=for-the-badge)](../README.md)
