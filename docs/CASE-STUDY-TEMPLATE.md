# Case Study Template (Truth-First, Sanitized)

Use this template for each public case study. Keep details concrete, but remove domain and IP-sensitive specifics.

---

## 1) Project Snapshot

- Project name (public-safe):  
- Timeframe:  
- My role:  
- Team context (size/function):  
- Problem category (domain-neutral):  

## 2) Problem

Describe the operational or product problem in plain terms.

Required:
- who experienced the problem
- what was failing or inefficient
- why it mattered

Do not include:
- client names
- sensitive record identifiers
- proprietary process language

## 3) Constraints

List constraints that shaped architecture decisions.

Examples:
- latency budget
- quality threshold
- privacy restrictions
- existing infrastructure limitations
- integration boundaries

## 4) My Ownership

Be explicit about what you personally owned:
- architecture decisions
- implementation areas
- instrumentation/ops responsibilities
- collaboration with product/domain stakeholders

## 5) Solution Design

Describe the solution using reusable engineering language:
- request classification and routing
- retrieval/context strategy
- model fallback and reliability controls
- output schema contracts
- provenance/traceability approach

## 6) Implementation Highlights

List 3 to 6 implementation details that prove depth.

Examples:
- introduced schema validation gate to prevent malformed outputs
- implemented provider fallback with timeout budgets
- instrumented stage-level latency and failure telemetry

## 7) Outcomes (Verified Only)

State only evidence-backed results.

Format:
- metric name:
- before:
- after:
- measurement method:
- confidence/limitations:

If no strong metric exists, use qualitative outcomes with validation method.

## 8) Tradeoffs and Lessons

Show technical maturity:
- what tradeoffs were accepted
- what you would improve in next iteration
- what decision you would keep unchanged

## 9) Relevance to Target Roles

Map to hiring signals:
- AI Engineer:
- Systems Architect:
- Product/AI Specialist:
- Domain-integrated AI practitioner:

## 10) Public-Safety Check

Confirm all statements pass:
- no confidential data
- no client-identifiable details
- no proprietary algorithms disclosed
- no unverified performance claims

---

## Quick Publish Checklist

Before committing a case study:
- run `scripts/sanity_check_portfolio.sh`
- verify each claim has proof
- remove domain-specific terminology
- have one reviewer check for accidental leakage
