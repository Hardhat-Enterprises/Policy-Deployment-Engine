# Client mimic — real check against hosted API

This folder pretends to be a customer org.

| File | Role |
| --- | --- |
| `main.tf` | What the client would write in Terraform |
| `plan.json` | What `terraform show -json` would produce (pre-baked for demo) |
| `package.json` | Package the client creates (policies + approved regions) |
| `package_au.json`, `package_us.json` | The same with Australian / US regions (`package_us.json` makes `app-connector` fail instead) |
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

# New org: saves the API key (checks) and a 12-hour session (packages)
./run-demo.sh --register

# Later: saved credentials, or sign in again once the session has ended
./run-demo.sh
./run-demo.sh --login <email> <password>
```

`check` uses the API key; `status` and `package` use the session. `--login` never changes the API
key, so it must already be saved for that org (from `--register`) or set as `PDE_API_KEY`.
The API allows 5 registrations per hour and 10 logins per 15 minutes from one IP.

Expected: **exit 1** (policy failure) with `legacy-connector` failing `region` (us-central1 is not
in `package.json`'s `australia-southeast1` / `australia-southeast2`) and `ip_cidr_range`
(`10.8.1.0/28` is not in the policy's approved ranges). Exit 0 is a pass, 2 an error.

## Optional: regenerate plan with real Terraform

```bash
# needs GCP creds / provider — optional
terraform init && terraform plan -out=tfplan && terraform show -json tfplan > plan.json
```
