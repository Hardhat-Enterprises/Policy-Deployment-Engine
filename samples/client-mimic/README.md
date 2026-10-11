# Client mimic — real check against hosted API

This folder pretends to be a customer org.

| File | Role |
| --- | --- |
| `main.tf` | What the client would write in Terraform |
| `plan.json` | What `terraform show -json` would produce (pre-baked for demo) |
| `package.json` | Package the client creates (policies + approved regions) |
| `run-demo.sh` | Full flow: status → create package → `check` via API |

## Prerequisites

```bash
# Node 24
cd tools/pde-gate-api && nvm use && npm start   # API + MySQL + opa on PATH
```

## Run

```bash
cd samples/client-mimic
chmod +x run-demo.sh

# Use existing ~/.pde-gate credentials (e.g. Acme), or:
./run-demo.sh --register

./run-demo.sh
```

Expected: **exit 1** with `legacy-connector` failing the region whitelist  
(`australia-southeast1` / `australia-southeast2` in `package.json`).

## Optional: regenerate plan with real Terraform

```bash
# needs GCP creds / provider — optional
terraform init && terraform plan -out=tfplan && terraform show -json tfplan > plan.json
```
