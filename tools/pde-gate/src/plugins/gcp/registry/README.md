# GCP version registry (architecture only)

Drop future packs as `*.json` here (not `*.schema.json`).

Each pack may declare:

- `terraform` / `google_provider` — which versions it targets  
- `attribute_maps` — resource type → attribute renames into a stable Rego shape  

**Today:** `loadVersionRegistry()` returns `null` → plan is flattened + version-gated only (pass-through).  
**Later:** implement matching in `loader.ts` and real rewrites in `applyVersionRegistry` — no change to the check API.
