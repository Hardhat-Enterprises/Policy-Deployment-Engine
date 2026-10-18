# How organisations use pde-gate (server-side check)

## Flow (current)

```text
Client CI                              Hosted pde-gate-api
─────────                              ───────────────────
terraform show -json → plan.json
pde-gate check --plan --package
  → POST plan + package_id + API key ──►  load package from MySQL
                                          find the plan's policies in policies/
                                          substitute approved_regions / zones
                                          run OPA, one policy at a time
                                 ◄──────  pass / fail / error JSON
```

- **Plan** is sent to the API for the check (MVP).
- **Rego stays on the server** (PDE `policies/` via `PDE_POLICIES_ROOT`).
- **Package** in DB = which policies + client region whitelist (`variables.approved_regions`).
  `policy_groups` maps a resource type to argument names — the policy folder names under
  `policies/gcp/<Service>/<resource_type>/` (e.g. `region`, `ip_cidr_range`, dotted names like
  `config.cmek_key_name`). Unknown resource types or arguments are rejected (400) when a package is
  created or updated. A resource type with no `policy_groups` entry runs all of its policies.

## Region whitelist (client choice)

Hardcoded regions in Rego are **defaults**. When the package has:

```json
"variables": {
  "approved_regions": ["europe-west1"],
  "approved_zones": ["europe-west1-b"]
}
```

the API rewrites, in a temporary copy of each selected policy, the `values` of any **whitelist**
condition on a single `region`, `zone` or `location` attribute before OPA evaluates it
(`tools/pde-gate-api/src/engine/opa.ts`, `substituteOrgValues`). The Rego in `policies/` is never
changed. Rules:

- Only a **non-empty** `approved_regions` / `approved_zones` is used; absent or `[]` keeps the policy's values.
- `region` and `location` use `approved_regions`; `zone` uses `approved_zones`.
- A condition is only rewritten when all of its own values have that shape (a region like
  `australia-southeast1`, a zone like `australia-southeast1-a`). A location whitelist of `global`,
  `US`/`EU` multi-regions or zones is left alone, and the check reports a warning.
- `location` keeps the case the policy uses (`google_storage_bucket/location` is upper case).
- Blacklists and other policy types are never rewritten.

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
npx tsx src/cli.ts check --plan ../../samples/client-mimic/plan.json --package <package_id>
```

## Check results

| status | HTTP | CLI exit | meaning |
| --- | --- | --- | --- |
| `pass` | 200 | 0 | every selected policy evaluated and passed |
| `fail` | 422 | 1 | at least one policy failed |
| `error` | 422 | 2 | nothing was evaluated (no policy matches the plan), or a policy could not be evaluated (OPA error, undefined message), or a content-security policy was selected (it needs Bandit findings this check does not produce) |

A check that evaluated nothing is never a pass. Resource types in the plan with no PDE policies
are listed in `warnings`.

## API keys

Only a sha256 hash of each API key is stored. `login` (email + password) therefore cannot
return the existing key: it issues a new one and the previous key stops working.

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
| Org + API key hash | MySQL `orgs` |
| Package (policy_groups + regions) | MySQL `packages` |
| Rego policies | Server disk (`policies/`) |
| Plan | Sent in check request (not persisted in MVP) |
