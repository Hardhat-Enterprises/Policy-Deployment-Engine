# pde-gate

CLI that runs PDE Rego policies against a **custom Terraform plan JSON** (organisation input), not student `compliant.tf` / `nonCompliant.tf` fixtures.

## Requirements

- Node.js 20+
- `opa` on PATH (OPA ~1.2, same as PDE)

## Organisation quickstart

See **[ORG-QUICKSTART.md](./ORG-QUICKSTART.md)** for the mentor/adopter walkthrough.

## Organisation registration

Registration starts **from the terminal**. The wizard is the temporary stand-in for the future portal popup.

```bash
cd tools/pde-gate
npm install

# Interactive onboarding popup in the terminal
npx tsx src/cli.ts register --output ../../samples/org-input/org-config.json
```

You will be asked for:

1. Organisation name  
2. Contact email  
3. Approved regions (comma-separated)  
4. Approved zones (comma-separated)

This writes `org-config.json`. Later CI uses that file for dynamic region/zone whitelisting.

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
- `--org-config` — registered org allowlists (from `pde-gate register`)
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
