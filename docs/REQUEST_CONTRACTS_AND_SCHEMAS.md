# Request Contracts and Schemas

Verified against private codebase commit `cf855f6` on `2026-02-18`.

## Page Navigation

[![Prev](https://img.shields.io/badge/Prev-4B5563?style=for-the-badge)](./SYSTEMS-ARCHITECTURE.md)
[![Index](https://img.shields.io/badge/Index-111827?style=for-the-badge)](./INDEX.md)
[![Next](https://img.shields.io/badge/Next-2563EB?style=for-the-badge)](./PROVING-GROUNDS.md)
[![Home](https://img.shields.io/badge/Home-0F172A?style=for-the-badge)](../README.md)

Synthetic examples that mirror production contract behavior without exposing private identifiers.

## 1. Edge Request DTO (Synthetic)

```ts
type GenerateBriefRequest = {
  requestId: string; // UUID
  workspaceId: string; // scoped tenant workspace
  actorRole: 'analyst' | 'reviewer' | 'admin';
  mode: 'summary' | 'deep_dive' | 'comparison';
  query: string; // max 1800 chars
  contextBudget: {
    maxSources: number; // 1..20
    maxTokens: number; // 512..12000
  };
  includeCitations: boolean;
  trace: {
    clientVersion: string;
    source: 'ui' | 'api';
  };
};
```

## 2. Output Artifact Schema (Synthetic JSON Schema)

```json
{
  "$id": "urn:portfolio:brief-output:v1",
  "type": "object",
  "required": ["run_id", "summary", "sections", "citations", "meta"],
  "properties": {
    "run_id": { "type": "string", "pattern": "^[a-zA-Z0-9_-]{10,64}$" },
    "summary": { "type": "string", "minLength": 80, "maxLength": 4000 },
    "sections": {
      "type": "array",
      "minItems": 1,
      "maxItems": 12,
      "items": {
        "type": "object",
        "required": ["title", "body", "citation_keys"],
        "properties": {
          "title": { "type": "string", "minLength": 3, "maxLength": 140 },
          "body": { "type": "string", "minLength": 40, "maxLength": 4000 },
          "citation_keys": {
            "type": "array",
            "items": { "type": "string", "pattern": "^C[0-9]{1,3}$" },
            "maxItems": 20
          }
        }
      }
    },
    "citations": {
      "type": "array",
      "minItems": 1,
      "items": {
        "type": "object",
        "required": ["key", "source_id", "confidence"],
        "properties": {
          "key": { "type": "string", "pattern": "^C[0-9]{1,3}$" },
          "source_id": { "type": "string", "minLength": 6, "maxLength": 128 },
          "confidence": { "type": "number", "minimum": 0, "maximum": 1 }
        }
      }
    },
    "meta": {
      "type": "object",
      "required": ["model", "latency_ms", "validation_version"],
      "properties": {
        "model": { "type": "string", "maxLength": 64 },
        "latency_ms": { "type": "integer", "minimum": 1, "maximum": 120000 },
        "validation_version": { "type": "string", "maxLength": 32 }
      }
    }
  }
}
```

## 3. Validator Behavior Matrix

| Validation Condition | Behavior | Result |
| --- | --- | --- |
| edge DTO parse failure | fail fast | `400` with deterministic contract error code |
| unsupported mode or role | fail fast | `403` or `422`, no model call |
| token/context budget overflow | fail fast | bounded rejection, no fallback execution |
| model output missing required fields | repair then retry | one bounded repair attempt |
| JSON parseable but schema-invalid output | repair then fallback | retry with stricter instruction, then fallback model |
| unresolved citation keys | fail fast at persistence gate | run rejected and counted in citation error metrics |
| provider timeout/5xx | fallback | alternate provider route with timeout budget |
| repeated failure after fallback | terminal error | typed failure response with trace-safe metadata |

## 4. Provenance Contract (Synthetic)

Citation map persisted per run:

```json
{
  "run_id": "run_9ad2e7f1",
  "citation_map": {
    "C1": "src_4f2e1a",
    "C2": "src_b17c90"
  },
  "retrieval_scope": {
    "workspace_id": "ws_8f21",
    "source_count": 6
  },
  "integrity": {
    "unresolved_keys": [],
    "out_of_scope_keys": []
  }
}
```

Contract guarantees:

- every citation key in output must map to one retrieved `source_id`
- every mapped `source_id` must belong to the request retrieval scope
- unresolved or out-of-scope citations block persistence
- citation maps are append-only after run completion

## 5. Signature Implementation Moves (Public-Safe)

1. **Validation before persistence:** output cannot be persisted unless schema and provenance checks both pass.
2. **Bounded repair strategy:** one controlled repair attempt before fallback avoids retry storms.
3. **Scope-locked citation map:** citation keys are validated against retrieval scope to prevent accidental cross-tenant leakage.

## Continue

[![Prev](https://img.shields.io/badge/Prev-4B5563?style=for-the-badge)](./SYSTEMS-ARCHITECTURE.md)
[![Index](https://img.shields.io/badge/Index-111827?style=for-the-badge)](./INDEX.md)
[![Next](https://img.shields.io/badge/Next-2563EB?style=for-the-badge)](./PROVING-GROUNDS.md)
[![Home](https://img.shields.io/badge/Home-0F172A?style=for-the-badge)](../README.md)
