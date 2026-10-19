# pde-gate (CLI)

Thin client: sends your Terraform plan to **pde-gate-api**. Rego + OPA run on the server.

## Quick start

```bash
# terminal 1 — API (needs MySQL + opa on PATH)
cd tools/pde-gate-api && npm install && npm run db:migrate && npm start

# terminal 2
cd tools/pde-gate && npm install
export PDE_API_URL=http://127.0.0.1:3847
npx tsx src/cli.ts register --name "Demo Org" --email you@example.com
npx tsx src/cli.ts package create --name baseline --regions australia-southeast1,australia-southeast2
npx tsx src/cli.ts check --plan ../../samples/org-input/plan.json --package <package_id>
```

See **[ORG-AND-PROD.md](./ORG-AND-PROD.md)** for DB verification and region whitelist.

CI secrets: `PDE_API_URL`, `PDE_ORG_ID`, `PDE_API_KEY` only — no Rego on the client.
