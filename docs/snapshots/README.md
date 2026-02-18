# Snapshot Artifacts

Public-safe verification artifacts generated from the private codebase.

## Current Snapshot

- [`architecture_snapshot_2026-02-18.md`](./architecture_snapshot_2026-02-18.md): raw command log and count output
- [`route_inventory_2026-02-18.md`](./route_inventory_2026-02-18.md): redacted route family and handler distribution
- [`schema_inventory_2026-02-18.md`](./schema_inventory_2026-02-18.md): redacted schema category and migration distribution

## Generation Workflow

1. Run `scripts/architecture_snapshot.sh <private-repo-path>`.
2. Paste command output into a new dated snapshot file.
3. Derive redacted inventories (route families, schema categories) without private names.
4. Link the new artifacts from `README.md` and `docs/ARCHITECTURE-DRIFT-CHECK.md`.
