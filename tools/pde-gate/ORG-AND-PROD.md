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

`approved_regions` must be GCP region names (`^[a-z]+-[a-z]+[0-9]+$`, e.g. `us-central1`) and
`approved_zones` zone names (`^[a-z]+-[a-z]+[0-9]+-[a-z]$`, e.g. `us-central1-a`); anything else is
rejected (400) when the package is created or updated.

The API rewrites, in a temporary copy of each selected policy, the `values` of any **whitelist**
condition on a single `region`, `zone` or `location` attribute before OPA evaluates it
(`tools/pde-gate-api/src/engine/opa.ts`, `substituteOrgValues`). The Rego in `policies/` is never
changed. Rules:

- Only a **non-empty** `approved_regions` / `approved_zones` is used; absent or `[]` keeps the policy's values.
- `region` and `location` use `approved_regions`; `zone` uses `approved_zones`.
- A condition is only rewritten when all of its own values have that shape (a region like
  `australia-southeast1`, a zone like `australia-southeast1-a`). A location whitelist of `global`,
  `US`/`EU` multi-regions or zones is left alone, and the check reports a warning.
- `location` keeps the case the policy uses (`google_storage_bucket/location` is upper case).
- `policy_type` is read case-insensitively (`"whitelist"` and `"Whitelist"` are the same).
- Blacklists and other policy types are never rewritten.

```bash
pde-gate package create --name baseline --regions europe-west1,europe-west2
pde-gate package set-regions pkg_xxx --regions australia-southeast1
```

## Register + verify DB

```bash
# 1) API (.env with MySQL creds)
cd tools/pde-gate-api
cp .env.example .env   # set PDE_DB_*, and GATE_SESSION_SECRET in production
npm install && npm run db:migrate && npm start

# 2) Register: prints the API key once (put it in CI as PDE_API_KEY) and starts a session
cd ../pde-gate && npm install
export PDE_API_URL=http://127.0.0.1:3847
PDE_PASSWORD='…at least 12 characters…' npx tsx src/cli.ts register --name "Acme" --email you@acme.com
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
| `error` | 422 | 2 | a policy could not be evaluated (OPA error, undefined message, or the helpers returned `POLICY ERROR:`), or nothing was evaluated (no policy matches the plan, or every selected policy was skipped) |

A check that evaluated nothing is never a pass. Resource types in the plan with no PDE policies
are listed in `warnings`.

A policy the helpers in `policies/_helpers` refuse (its message carries `POLICY ERROR:`, e.g. an
`element required` condition with an empty `values` list) checked nothing, so it is an `error`
entry carrying the helper's text from `POLICY ERROR:` onwards, never a pass.

`policies` lists every selected policy with its own status: `pass`, `fail`, `error` or `skipped`.
Content-security policies (on `dev`, the six `google_ces_agent` `*_callbacks.python_code` ones)
need Bandit findings the gate does not produce. They are `skipped`, named in `warnings`, not
counted in `evaluated`, and do not decide the result; the other policies do.

## API keys and sessions

Two credentials, two jobs:

| Credential | Comes from | Used for |
| --- | --- | --- |
| API key (`pde_…`, `PDE_API_KEY`) | shown **once**, at registration (and by a rotation) | `POST /v1/orgs/:orgId/checks` only |
| Session token (`pds.…`) | `POST /v1/orgs/login` (and registration); valid 12 hours | the org, package routes and key rotation; the portal uses it |

- Logging in never changes the API key, so a portal or CLI login cannot break a CI pipeline.
- `POST /v1/orgs/:orgId/api-key/rotate` (session required) is the only way to replace the key: it
  returns the new key once and the old one stops working at once. CLI: `pde-gate api-key rotate`.
- Only a sha256 hash of each API key is stored.
- Registration requires a password of at least 12 characters; it is what `login` checks, so it is
  the only way back in once a session ends. Passwords are used exactly as typed: never trimmed.
- Sessions are HMAC-SHA256-signed with `GATE_SESSION_SECRET`. With `NODE_ENV=production` the server
  refuses to start unless it is set (at least 32 characters). Elsewhere a missing secret falls back
  to a random one per process, so sessions end when the server restarts.

## Rate limits

`POST /v1/orgs/register` and `POST /v1/orgs/login` are limited per client IP; over the limit the API
answers `429 {"error": "too many requests, try again later"}`. Every attempt counts, including
rejected ones.

| Route | Default | Env |
| --- | --- | --- |
| login | 10 per 15 minutes | `PDE_LOGIN_RATE_LIMIT`, `PDE_LOGIN_RATE_WINDOW_MINUTES` |
| register | 5 per hour | `PDE_REGISTER_RATE_LIMIT`, `PDE_REGISTER_RATE_WINDOW_MINUTES` |

The counters live in the API process's memory: they reset on restart, and each instance counts on
its own.

**Behind a reverse proxy or load balancer, set `PDE_TRUST_PROXY`.** Without it every request comes
from the proxy's address, so all clients share one counter and a handful of logins locks everyone
out. `PDE_TRUST_PROXY` is Express's `trust proxy` setting: the number of proxy hops in front of the
API (usually `1`), or the proxies' addresses / subnets. Only trust proxies you run: a trusted hop's
`X-Forwarded-For` decides the client IP.

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
