# Compatibility registry (Phase 2 — Terraform / provider versions)

This folder will hold provider-version field mappings. **Not required for MVP.**

```text
plan-normalise.ts
    → mapProviderAttributes()   ← calls registry loader (Phase 2)
    → registry/*.json           ← per resource type
```

**MVP org adoption does not depend on this.** Plug in registry JSON + loader here without changing:
- `resolve-org-config.ts` (org settings)
- `policy-select.ts` (which policies run)
- `portal-client.ts` (token + API)
- PDE Rego policies

See SRS §5.4 and §12 Step 3.
