# Portfolio Extraction Playbook

This playbook describes how to convert work from a private codebase into a high-quality public portfolio without leaking sensitive context or proprietary implementation.

## Objective

Produce publishable artifacts that show:
- system architecture depth
- practical AI engineering decisions
- measurable outcomes
- professional risk judgment

Without revealing:
- private source code
- client/domain-sensitive details
- proprietary platform IP

## Extraction Workflow

## 1) Build an Internal Inventory (Private Workspace)

Create a private list of potential artifacts:
- architecture diagrams
- module responsibilities
- deployment/ops patterns
- incidents and fixes
- measurable improvements

Tag each item:
- `public-safe`
- `public-safe-with-redaction`
- `private-only`

## 2) Convert to Domain-Neutral Language

Translate domain terms into reusable engineering terms.

Examples:
- domain-specific workflow -> document-centric workflow
- specialist review path -> expert review path
- internal object metadata -> record metadata

## 3) Extract Patterns, Not Source

Publish:
- architecture diagrams
- decision rationales
- pseudocode-level workflows
- reliability/security strategies
- metric summaries

Do not publish:
- source files from private repo
- proprietary heuristics
- schema/details tied to confidential data models

## 4) Draft Case Studies

For each major achievement:
- use `docs/CASE-STUDY-TEMPLATE.md`
- include only verified outcomes
- explicitly separate personal ownership from team contributions

Recommended count:
- 2 to 4 strong case studies

## 5) Attach Role Relevance

For each artifact, map value to:
- AI Engineer
- Systems Architect
- Product/AI Specialist
- Domain-integrated knowledge workflows

Use `docs/SKILLS-EVIDENCE-MATRIX.md` for consistency.

## 6) Run Safety Checks Before Publish

- run `scripts/sanity_check_portfolio.sh`
- manually review for accidental private language
- ask one trusted reviewer to perform a leakage pass

## 7) Publish and Iterate

Each update should improve one of:
- clarity
- evidence quality
- relevance to target roles

## Suggested Repository Rhythm

Weekly:
- add one architecture or decision note
- improve one case study section with better evidence

Monthly:
- refresh skills/evidence mapping for current target roles
- prune weak or redundant claims
