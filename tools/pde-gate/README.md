# pde-gate

CLI that runs PDE Rego policies against a **custom Terraform plan JSON** (organisation input), not student `compliant.tf` / `nonCompliant.tf` fixtures.

## Requirements

- Node.js 20+
- `opa` on PATH (OPA ~1.2, same as PDE)

## Usage (from this repo)

```bash
cd tools/pde-gate
npm install

npx tsx src/cli.ts check \
  --plan ../../samples/org-input/plan.json \
  --policies ../../policies
```

`samples/org-input/plan.json` is a combined org plan: one resource with every gated field set correctly, and one resource that fails every field. PDE still evaluates **all** `.rego` files for that resource type, not a single argument.

- `--plan` — org-shaped `terraform show -json` output
- `--policies` — PDE `policies/` tree (`_helpers` + resource folders)
- `--format text|json` — default `text` (stable `PDE_GATE_*` lines for CI)
- `--output <file>` — write the JSON report even when printing text

Matching: resource types in the plan vs `_vars.rego` `resource_type`. Every `.rego` for those types is evaluated.

Exit `0` if all pass, `1` if any fail, `2` on tool/input errors.

CI can grep `^FAILED ` or consume `--format json`. On GitHub Actions, failed rows also emit `::error::` annotations.

Text lines:

- `FAILED id=<resource> parameter=<field> reason="<remedy>"`
- `passed=<resource,...>` — resources that passed that parameter check
