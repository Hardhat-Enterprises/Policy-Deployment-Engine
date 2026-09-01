# pde-gate-portal — Minimal Portal API (Step 2)

Local portal + API for capstone demo. Production would use Postgres + hosted UI — **same API contract**.

## What it does

| Endpoint | Purpose |
| -------- | ------- |
| `GET /register` | Browser registration form |
| `GET /settings` | Update regions / policy profile (token required) |
| `POST /v1/orgs/register` | Create org → returns `org_id` + `token` |
| `GET /v1/orgs/:orgId/config` | **Validate token** → return full org config JSON |
| `PATCH /v1/orgs/:orgId/config` | **Validate token** → update regions / profile |

Org data stored in `data/orgs.json` (demo DB).

## Quick start

**Terminal 1 — start portal:**

```bash
cd tools/pde-gate-portal
npm install
npm start
```

**Terminal 2 — register (production CLI flow):**

```bash
cd tools/pde-gate
export PDE_API_URL=http://localhost:3847
export PDE_PORTAL_URL=http://localhost:3847
npm run register:portal
```

Browser opens → configure regions → credentials saved automatically to `~/.pde-gate/credentials.json`.

Or open http://localhost:3847/register manually and copy token for CI.

**Terminal 3 — verify + run check:**

```bash
cd tools/pde-gate
export PDE_API_URL=http://localhost:3847
export PDE_PORTAL_URL=http://localhost:3847

npm run status

npx tsx src/cli.ts check \
  --plan ../../samples/org-input/plan.json \
  --policies ../../policies
```

With credentials saved locally, `--org-id` is optional. For CI, set `PDE_ORG_ID` + `PDE_ORG_TOKEN` instead.

pde-gate **inside the package** calls `GET /v1/orgs/:id/config` with the token. API validates → returns regions + `policy_profile` → policies run.

## Flow

```text
Browser /register  →  POST /v1/orgs/register  →  data/orgs.json
CI pde-gate check  →  GET /v1/orgs/:id/config  →  token validated  →  org config
```

## Tests

```bash
npm test
```

## Environment

| Variable | Default |
| -------- | ------- |
| `PDE_PORTAL_PORT` | `3847` |

Point pde-gate with `PDE_API_URL` and `PDE_PORTAL_URL` (see above).
