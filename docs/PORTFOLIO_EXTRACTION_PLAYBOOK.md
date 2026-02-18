# Portfolio Extraction Playbook

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
- manual diff review for disclosure

8. Keep updates incremental.
- add or revise one artifact at a time
- remove weak or unverifiable claims
