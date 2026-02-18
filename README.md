# AI Intelligence Workflow

Public documentation derived from a private AI platform codebase.

## Scope

- no private source code
- no client or domain identifiers
- no proprietary algorithms or internal schemas
- only verified claims

## Repository Contents

- [`docs/SYSTEMS-ARCHITECTURE.md`](docs/SYSTEMS-ARCHITECTURE.md)
- [`docs/SKILLS-EVIDENCE-MATRIX.md`](docs/SKILLS-EVIDENCE-MATRIX.md)
- [`docs/CASE-STUDY-TEMPLATE.md`](docs/CASE-STUDY-TEMPLATE.md)
- [`docs/PORTFOLIO_EXTRACTION_PLAYBOOK.md`](docs/PORTFOLIO_EXTRACTION_PLAYBOOK.md)
- [`docs/PRIVACY_IP_GUARDRAILS.md`](docs/PRIVACY_IP_GUARDRAILS.md)
- [`scripts/sanity_check_portfolio.sh`](scripts/sanity_check_portfolio.sh)

## Update Workflow

1. Update architecture or case-study docs.
2. Verify every claim has a measurement source.
3. Copy `.portfolio-sensitive-terms.example.txt` to `.portfolio-sensitive-terms.txt` and add private terms.
4. Run `./scripts/sanity_check_portfolio.sh .`.
5. Review the diff for disclosure risk before publish.
