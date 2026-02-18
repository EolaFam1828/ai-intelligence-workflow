# Architecture Drift Check

Source repository audited: private source repository  
Audit date: `2026-02-18`  
Commit: `cf855f6`

## Findings

| Source | Documented Claim | Code Observation | Status |
| --- | --- | --- | --- |
| `TECH_SPEC.md:91` and `TECH_SPEC.md:369` | `16 route modules` and `117+ endpoints` | `25` route files under `server/src/routes`, `151` route handlers (`router.get/post/put/patch/delete`) | stale |
| `TECH_SPEC.md:106` and `TECH_SPEC.md:200` | `44 models` and `18 migrations` | `49` Prisma models, `22` migration directories | stale |
| `README.md:228` | `147 API endpoints` | `151` route handlers by current code count | stale |
| `TECH_SPEC.md:1071` | `No mobile optimization` | responsive mobile shell paths in `App.tsx:188`, `App.tsx:292`, `App.tsx:319`; validated by sanitized mobile render capture | stale |

## Command Log

```bash
cd <private-repo-root>
rg -n "router\\.(get|post|put|patch|delete)\\(" server/src/routes -g '*.ts' | wc -l
rg -n '^model\\s+' prisma/schema.prisma | wc -l
find prisma/migrations -mindepth 1 -maxdepth 1 -type d | wc -l
find server/src/routes -type f -name '*.ts' | wc -l
rg -n "<Route path=\"" App.tsx | wc -l
```

## Update Policy

- run `scripts/architecture_snapshot.sh` before publishing architecture claims
- if counts change, update `README.md` and `docs/SYSTEMS-ARCHITECTURE.md`
- keep claims numeric where possible
