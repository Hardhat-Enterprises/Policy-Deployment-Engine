# pde-gate-api

Express + Sequelize + MySQL config API for PDE Gate.

## Endpoints

| Method | Path | Auth |
| --- | --- | --- |
| GET | `/health` | none |
| POST | `/v1/orgs/register` | `org_name`, `contact_email`, `password` (at least 12 characters) → `org_id`, `api_key` (shown only here) and a session token |
| POST | `/v1/orgs/login` | email + password → a 12-hour `session_token`; the API key is unchanged |
| GET | `/v1/orgs/:orgId` | Bearer session token |
| GET/POST | `/v1/orgs/:orgId/packages` | Bearer session token |
| GET/PATCH/DELETE | `/v1/orgs/:orgId/packages/:packageId` | Bearer session token |
| GET | `/v1/orgs/:orgId/policy-catalog?platform=gcp` | Bearer session token → each resource type with its argument policies (for building `policy_groups`) |
| POST | `/v1/orgs/:orgId/api-key/rotate` | Bearer session token → a new `api_key`, shown once; the old one stops working |
| POST | `/v1/orgs/:orgId/checks` | Bearer `PDE_API_KEY` → `status` pass (200) / fail (422) / error (422) |

Session tokens are HMAC-signed with `GATE_SESSION_SECRET`; with `NODE_ENV=production` the server
will not start without it (at least 32 characters). Passwords are never trimmed. Register and login
are rate limited per client IP (`PDE_LOGIN_RATE_*`, `PDE_REGISTER_RATE_*`; set `PDE_TRUST_PROXY`
behind a proxy). See `../pde-gate/ORG-AND-PROD.md`.

API keys are stored only as sha256 hashes. Error responses never carry internal error text:
an unexpected failure is `500 {"error": "internal server error"}` (details go to the server log).
See [../pde-gate/ORG-AND-PROD.md](../pde-gate/ORG-AND-PROD.md) for packages, region substitution
and check results.

## Setup

1. Copy `.env.example` → `.env` and set MySQL credentials.
2. Create DB: `CREATE DATABASE pde_gate;`
3. `npm install && npm run db:migrate && npm start` — the migrations create the `orgs` and
   `packages` tables, and bring a database created before them up to date (hash the plaintext
   `token` column, add missing unique indexes and the packages → orgs foreign key).

## Tests

`npm test` needs `opa` on PATH for the end-to-end evaluation tests (they skip without it).
`src/orgs.integration.test.ts` needs a migrated MySQL from `.env` and skips when none is reachable.

Default port: `3847` (`PDE_PORTAL_PORT` or `PDE_API_PORT`).

GCP is the MVP platform; package `platforms` defaults to `["gcp"]`.
