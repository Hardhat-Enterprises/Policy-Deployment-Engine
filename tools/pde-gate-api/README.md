# pde-gate-api

Express + Sequelize + MySQL config API for PDE Gate.

## Endpoints

| Method | Path | Auth |
| --- | --- | --- |
| GET | `/health` | none |
| POST | `/v1/orgs/register` | none → returns `org_id` + `api_key` |
| GET | `/v1/orgs/:orgId` | Bearer `PDE_API_KEY` |
| GET/POST | `/v1/orgs/:orgId/packages` | Bearer |
| GET/PATCH/DELETE | `/v1/orgs/:orgId/packages/:packageId` | Bearer |
| GET | `/v1/orgs/:orgId/policy-catalog?platform=gcp` | Bearer; discovers available resource policies |
| POST | `/v1/orgs/:orgId/checks` | Bearer; evaluates a Terraform plan with a saved package |

## Setup

1. Copy `.env.example` → `.env` and set MySQL credentials.
2. Create DB: `CREATE DATABASE pde_gate;`
3. `npm install && npm run db:migrate && npm start`

Default port: `3847` (`PDE_PORTAL_PORT` or `PDE_API_PORT`).

GCP is the MVP platform; package `platforms` defaults to `["gcp"]`.
