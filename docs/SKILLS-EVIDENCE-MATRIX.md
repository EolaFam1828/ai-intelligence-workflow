# Skills Evidence Matrix

Verified against private codebase commit `cf855f6` on `2026-02-18`.

## Page Navigation

[![Prev](https://img.shields.io/badge/Prev-4B5563?style=for-the-badge)](./PROVING-GROUNDS.md)
[![Index](https://img.shields.io/badge/Index-111827?style=for-the-badge)](./INDEX.md)
[![Next](https://img.shields.io/badge/Next-2563EB?style=for-the-badge)](./CASE-STUDY-INTELLIGENCE-BRIEF.md)
[![Home](https://img.shields.io/badge/Home-0F172A?style=for-the-badge)](../README.md)

## Capability Mapping

| Capability | Artifact | Evidence Check |
| --- | --- | --- |
| AI orchestration | `docs/SYSTEMS-ARCHITECTURE.md`, `docs/PROVING-GROUNDS.md` | routing + stage flow and edge contract enforcement documented |
| Retrieval design | `docs/SYSTEMS-ARCHITECTURE.md` | retrieval + context stages documented |
| Structured outputs | `docs/SYSTEMS-ARCHITECTURE.md` | schema validation gate documented |
| Reliability controls | `docs/PROVING-GROUNDS.md` | timeout/retry/fallback + incident mitigations documented |
| Provenance | `docs/SYSTEMS-ARCHITECTURE.md`, `docs/PROVING-GROUNDS.md` | citation placeholder to source mapping + persistence boundary documented |
| Privacy/IP controls | `docs/PRIVACY_IP_GUARDRAILS.md` | publication boundaries documented |
| Delivery outcomes | `docs/CASE-STUDY-INTELLIGENCE-BRIEF.md` | completed case study includes quantified before/after + measurement method |
| Visual implementation proof | `docs/VISUAL-WALKTHROUGH.md`, `docs/VISUAL-WALKTHROUGH-AUTHENTICATED.md` | sanitized landing and authenticated module captures included |
| Architecture currency check | `docs/ARCHITECTURE-DRIFT-CHECK.md` | stale claims identified with code-level counts |

## Provenance Implementation (Sanitized)

- retrieval emits normalized context chunks with `source_id`, `doc_type`, and redacted location metadata
- prompt assembly injects citation placeholders (`[C1]`, `[C2]`) bound to those `source_id` values
- generation output is post-processed into a citation map `{citation_key -> source_id}`
- validation fails if any citation key is unresolved or references a source outside the retrieved context set
- persistence stores response text, citation map, and retrieval IDs together for auditability without exposing private corpus contents

## Claim Format

Each claim should include:
- ownership scope
- implementation method
- verification method
- known limits

## Continue

[![Prev](https://img.shields.io/badge/Prev-4B5563?style=for-the-badge)](./PROVING-GROUNDS.md)
[![Index](https://img.shields.io/badge/Index-111827?style=for-the-badge)](./INDEX.md)
[![Next](https://img.shields.io/badge/Next-2563EB?style=for-the-badge)](./CASE-STUDY-INTELLIGENCE-BRIEF.md)
[![Home](https://img.shields.io/badge/Home-0F172A?style=for-the-badge)](../README.md)
