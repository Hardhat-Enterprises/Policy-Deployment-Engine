# pde-gate

CLI that runs PDE Rego policies against a **custom Terraform plan JSON** (organisation input), not student `compliant.tf` / `nonCompliant.tf` fixtures.

## Requirements

- **Node.js 20+** (run `nvm use` in `tools/pde-gate` — `.nvmrc` is included)
- `opa` on PATH (OPA ~1.2, same as PDE)

## Organisation quickstart

See **[ORG-QUICKSTART.md](./ORG-QUICKSTART.md)** for the mentor/adopter walkthrough.

## Organisation registration

Two modes — same prod architecture, different config delivery:

| Mode | Command | Use when |
| ---- | ------- | -------- |
| **file** (MVP) | `pde-gate register --mode file` | Capstone demo, air-gapped CI |
| **portal** (prod) | `pde-gate register --mode portal` | Browser signup → auto-saves token; config from API |

```bash
# MVP — writes org-config.json
npx tsx src/cli.ts register --mode file --output ../../samples/org-input/org-config.json

# Production — opens portal, saves ~/.pde-gate/credentials.json (callback — no paste)
npx tsx src/cli.ts register --mode portal

# Verify portal connection
npx tsx src/cli.ts status
```

## Architecture (scalable layers)

```text
resolve-org-config   →  file | portal API | credentials  (Layer 1)
plan-normalise       →  flatten + version detect         (Layer 2; registry in Phase 2)
policy-select        →  enabled_policies per resource    (Layer 3)
OPA + PDE Rego       →  enforcement                      (Layer 4)
```

Terraform version registry plugs into `src/normalizer/` later — no rebuild of auth or policy selection.

See **[MENTOR-BRIEF.md](./MENTOR-BRIEF.md)** for production flow and mentor summary.

### Local portal API (Step 2 demo)

```bash
# Terminal 1
cd tools/pde-gate-portal && npm install && npm start

# Terminal 2 — browser: http://localhost:3847/register

# Terminal 3
export PDE_API_URL=http://localhost:3847 PDE_PORTAL_URL=http://localhost:3847
export PDE_ORG_ID=... PDE_ORG_TOKEN=...
npx tsx src/cli.ts check --plan ../../samples/org-input/plan.json --policies ../../policies --org-id $PDE_ORG_ID
```

## Usage (from this repo)

```bash
cd tools/pde-gate
npm install

npx tsx src/cli.ts check \
  --plan ../../samples/org-input/plan.json \
  --policies ../../policies \
  --org-config ../../samples/org-input/org-config.json
```

`samples/org-input/plan.json` is a combined org plan: one resource with every gated field set correctly, and one resource that fails every field. PDE still evaluates **all** `.rego` files for that resource type, not a single argument.

- `--plan` — org-shaped `terraform show -json` output
- `--policies` — PDE `policies/` tree (`_helpers` + resource folders)
- `--org-config` — org settings file (MVP / air-gapped)
- `--org-id` — fetch config from portal API using `PDE_ORG_TOKEN` (production)
- `--require-org-config` — fail if no org config source is available
- `--strict-versions` — fail when Terraform / plan format / Google provider is outside the PDE support matrix (default: warn only)
- `--format text|json` — default `text` (stable `PDE_GATE_*` lines for CI)
- `--output <file>` — write the JSON report even when printing text

Matching: resource types in the plan vs `_vars.rego` `resource_type`. Every `.rego` for those types is evaluated.

With `--org-config`, pde-gate merges `org_config.approved_regions` / `approved_zones` into the OPA input. Region and zone **whitelist** policies read `input.org_config` automatically via `_helpers/org_config.rego`.

Policy subset: set `policy_profile` (`full` | `baseline`) or `enabled_policies` in org-config. See `ORG-QUICKSTART.md`.

### Terraform versions (multi-org)

Orgs use **different HashiCorp Terraform** and Google provider versions. pde-gate handles this **per organisation** via `org-config.json` + plan normalisation — see SRS **§3.6** and **§4A.5**.

**Scope:** Terraform only (`terraform plan` / `terraform show -json`). OpenTofu is out of scope for now.

**Three version layers:**

| Layer | Field in plan | Who sets the rule |
| ----- | ------------- | ----------------- |
| Terraform CLI | `terraform_version` | PDE matrix + org `min_version`/`max_version` |
| Plan JSON schema | `format_version` | PDE matrix |
| Google provider | often **missing** from plan | Org **must** declare `google_provider_version` in org-config |

Before OPA runs, pde-gate:

1. Detects versions from plan + org-config
2. Validates against PDE support matrix and org constraints
3. Flattens nested `child_modules`
4. Prints `PDE_GATE_TF terraform=... format=... google=... resources=...`

```json
"terraform": {
  "cli_version": "1.9.2",
  "google_provider_version": "7.37.0",
  "min_version": "1.6.0",
  "max_version": "1.9.99",
  "allowed_google_provider": ["7.37.0"],
  "lock_file": ".terraform.lock.hcl"
}
```

- Default: warn (`PDE_GATE_WARN`) on mismatch  
- `--strict-versions`: fail CI (exit 2) — recommended for production  

PDE policies are authored against Google provider **7.37.0**. Provider **6.x and below are not supported**.

Exit `0` if all pass, `1` if any fail, `2` on tool/input errors.

CI can grep `^FAILED ` or consume `--format json`. On GitHub Actions, failed rows also emit `::error::` annotations.

Text lines:

- `FAILED id=<resource> parameter=<field> reason="<remedy>"`
- `passed=<resource,...>` — resources that passed that parameter check
