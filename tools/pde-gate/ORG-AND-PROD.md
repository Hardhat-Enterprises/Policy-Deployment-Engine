# How organisations use pde-gate (server-side check)

## Flow (current)

```text
Client CI                              Hosted pde-gate-api
─────────                              ───────────────────
terraform show -json → plan.json
pde-gate check --plan --package
  → POST plan + package_id + API key ──►  load package from MySQL
                                          load Rego from policies/
                                          merge approved_regions into org_config
                                          run OPA
                                 ◄──────  PASS / FAIL JSON
```

- **Plan** is sent to the API for the check (MVP).
- **Rego stays on the server** (PDE `policies/` via `PDE_POLICIES_ROOT`).
- **Package** in DB = which policies + client region whitelist (`variables.approved_regions`).

## Region whitelist (client choice)

Hardcoded regions in Rego are **defaults**. When the package has:

```json
"variables": {
  "approved_regions": ["europe-west1"],
  "approved_zones": ["europe-west1-b"]
}
```

the helper `policies/_helpers/org_config.rego` uses those for region/zone **whitelist** checks.

```bash
pde-gate package create --name baseline --regions europe-west1,europe-west2
pde-gate package set-regions pkg_xxx --regions australia-southeast1
```

## Register + verify DB

```bash
# 1) API (.env with MySQL creds)
cd tools/pde-gate-api
cp .env.example .env   # set PDE_DB_* 
npm install && npm run db:migrate && npm start

# 2) Register
cd ../pde-gate && npm install
export PDE_API_URL=http://127.0.0.1:3847
npx tsx src/cli.ts register --name "Acme" --email you@acme.com
npx tsx src/cli.ts status

# 3) MySQL check
mysql -u pde -p -e "USE pde_gate; SELECT org_id, org_name FROM orgs; SELECT package_id, name, variables FROM packages;"

# 4) Package + check
npx tsx src/cli.ts package create --name baseline --regions australia-southeast1,australia-southeast2
npx tsx src/cli.ts check --plan ../../samples/org-input/plan.json --package <package_id>
```

## Version enforcement (GCP)

Hosted checks **fully enforce** by default:

- Terraform CLI: `1.5.0`–`1.99.99`
- Plan `format_version`: `1.0` / `1.1` / `1.2`
- Google provider: `7.0.0`–`7.99.99` (PDE pin **7.37.0**)

Configured in `tools/pde-gate-api/src/engine/plugins/gcp/canonicalizer.ts` (`PDE_SUPPORT_MATRIX`).

If the plan JSON has no provider version, set on the package:

```json
"variables": { "google_provider_version": "7.37.0", "approved_regions": ["…"] }
```

Relax only with `strict_versions: false` / CLI `--no-strict-versions`.

## What is stored where

| Thing | Where |
| --- | --- |
| Org + API key | MySQL `orgs` |
| Package (policy_groups + regions) | MySQL `packages` |
| Rego policies | Server disk (`policies/`) |
| Plan | Sent in check request (not persisted in MVP) |
