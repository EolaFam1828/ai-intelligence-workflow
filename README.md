# AI Intelligence Workflow

Public architecture and operations dossier for a private AI platform.

[![Portfolio Sanity Check](https://github.com/EolaFam1828/ai-intelligence-workflow/actions/workflows/sanity-check.yml/badge.svg)](https://github.com/EolaFam1828/ai-intelligence-workflow/actions/workflows/sanity-check.yml)

This repository shows how the platform is designed, validated, and operated under privacy constraints.

## Why No Source Code

The production TypeScript source is intentionally private because it includes client-sensitive workflows, proprietary ranking/routing logic, and internal schemas.
This public repo is a clean-room evidence package: architecture, controls, measurements, and outcomes without disclosing private implementation details.

## What This Repo Proves

- architecture and control-boundary design for multi-stage AI workflows
- evidence discipline with measured snapshots and drift checks
- privacy/IP publication guardrails with automated sanity checks
- delivery outcomes using sanitized case studies

## Verified Snapshot

Source repository checked: private source repository  
Commit: `cf855f6`  
Verification date: `2026-02-18`

| Metric | Current Value |
| --- | --- |
| Frontend route definitions | 24 |
| Sidebar navigation modules | 13 |
| Backend route files (`server/src/routes`) | 25 |
| Backend route handlers (`router.get/post/put/patch/delete`) | 151 |
| Prisma models | 49 |
| Prisma migrations | 22 |
| Service-layer TypeScript files | 37 |
| Frontend component files (`.tsx`) | 87 |

## Documentation Index

See [`docs/INDEX.md`](docs/INDEX.md) for a full navigation table.

| Area | Primary Document |
| --- | --- |
| system topology + controls | [`docs/SYSTEMS-ARCHITECTURE.md`](docs/SYSTEMS-ARCHITECTURE.md) |
| deep operational proof | [`docs/PROVING-GROUNDS.md`](docs/PROVING-GROUNDS.md) |
| architecture drift evidence | [`docs/ARCHITECTURE-DRIFT-CHECK.md`](docs/ARCHITECTURE-DRIFT-CHECK.md) |
| capability-to-evidence mapping | [`docs/SKILLS-EVIDENCE-MATRIX.md`](docs/SKILLS-EVIDENCE-MATRIX.md) |
| sanitized outcomes | [`docs/CASE-STUDY-INTELLIGENCE-BRIEF.md`](docs/CASE-STUDY-INTELLIGENCE-BRIEF.md) |
| publication guardrails | [`docs/PRIVACY_IP_GUARDRAILS.md`](docs/PRIVACY_IP_GUARDRAILS.md) |
| extraction workflow | [`docs/PORTFOLIO_EXTRACTION_PLAYBOOK.md`](docs/PORTFOLIO_EXTRACTION_PLAYBOOK.md) |

## Visual Walkthrough

![Sanitized UI Desktop](assets/screenshots/ui-overview-desktop-sanitized.png)

![Sanitized UI Mobile](assets/screenshots/ui-overview-mobile-sanitized.png)

![Sanitized Authenticated Workflow Module](assets/screenshots/ui-module-workflow-auth-sanitized.png)

## Repository Contents

- [`docs/INDEX.md`](docs/INDEX.md)
- [`docs/SYSTEMS-ARCHITECTURE.md`](docs/SYSTEMS-ARCHITECTURE.md)
- [`docs/PROVING-GROUNDS.md`](docs/PROVING-GROUNDS.md)
- [`docs/VISUAL-WALKTHROUGH.md`](docs/VISUAL-WALKTHROUGH.md)
- [`docs/VISUAL-WALKTHROUGH-AUTHENTICATED.md`](docs/VISUAL-WALKTHROUGH-AUTHENTICATED.md)
- [`docs/ARCHITECTURE-DRIFT-CHECK.md`](docs/ARCHITECTURE-DRIFT-CHECK.md)
- [`docs/SKILLS-EVIDENCE-MATRIX.md`](docs/SKILLS-EVIDENCE-MATRIX.md)
- [`docs/CASE-STUDY-TEMPLATE.md`](docs/CASE-STUDY-TEMPLATE.md)
- [`docs/CASE-STUDY-INTELLIGENCE-BRIEF.md`](docs/CASE-STUDY-INTELLIGENCE-BRIEF.md)
- [`docs/PORTFOLIO_EXTRACTION_PLAYBOOK.md`](docs/PORTFOLIO_EXTRACTION_PLAYBOOK.md)
- [`docs/PRIVACY_IP_GUARDRAILS.md`](docs/PRIVACY_IP_GUARDRAILS.md)
- [`scripts/architecture_snapshot.sh`](scripts/architecture_snapshot.sh)
- [`scripts/sanity_check_portfolio.sh`](scripts/sanity_check_portfolio.sh)
- [`scripts/install_git_hooks.sh`](scripts/install_git_hooks.sh)
- [`.githooks/pre-commit`](.githooks/pre-commit)
- [`.github/workflows/sanity-check.yml`](.github/workflows/sanity-check.yml)

## Update Workflow

1. Refresh counts from private source with `scripts/architecture_snapshot.sh <private-repo-path>`.
2. Update architecture or case-study docs (including `docs/ARCHITECTURE-DRIFT-CHECK.md` status updates).
3. Verify every claim has a measurement source.
4. Copy `.portfolio-sensitive-terms.example.txt` to `.portfolio-sensitive-terms.txt` and add private terms.
5. Install hooks once with `./scripts/install_git_hooks.sh` (runs `sanity_check_portfolio.sh` on each commit).
6. Run `./scripts/sanity_check_portfolio.sh .` locally when preparing a publish update.
7. Ensure CI passes `Portfolio Sanity Check` in `.github/workflows/sanity-check.yml`.
8. Review the diff for disclosure risk before publish.
