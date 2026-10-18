# pde-gate-api

Express + Sequelize + MySQL config API for PDE Gate.

## Endpoints

| Method | Path | Auth |
| --- | --- | --- |
| GET | `/health` | none |
| POST | `/v1/orgs/register` | none → returns `org_id` + `api_key` |
| POST | `/v1/orgs/login` | email + password → a **new** `api_key` (the old one stops working) |
| GET | `/v1/orgs/:orgId` | Bearer `PDE_API_KEY` |
| GET/POST | `/v1/orgs/:orgId/packages` | Bearer |
| GET/PATCH/DELETE | `/v1/orgs/:orgId/packages/:packageId` | Bearer |
| POST | `/v1/orgs/:orgId/checks` | Bearer → `status` pass (200) / fail (422) / error (422) |

API keys are stored only as sha256 hashes. Error responses never carry internal error text:
an unexpected failure is `500 {"error": "internal server error"}` (details go to the server log).
See [../pde-gate/ORG-AND-PROD.md](../pde-gate/ORG-AND-PROD.md) for packages, region substitution
and check results.

## Setup

1. Copy `.env.example` → `.env` and set MySQL credentials.
2. Create DB: `CREATE DATABASE pde_gate;`
3. `npm install && npm run db:migrate && npm start` — the migrations create the `orgs` and
   `packages` tables, and convert a database created before key hashing.

## Tests

`npm test` needs `opa` on PATH for the end-to-end evaluation tests (they skip without it).
`src/orgs.integration.test.ts` needs a migrated MySQL from `.env` and skips when none is reachable.

Default port: `3847` (`PDE_PORTAL_PORT` or `PDE_API_PORT`).

GCP is the MVP platform; package `platforms` defaults to `["gcp"]`.
