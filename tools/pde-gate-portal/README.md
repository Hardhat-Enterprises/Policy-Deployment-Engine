# PDE Gate Web Portal (`tools/pde-gate-portal`)

Web Portal frontend for PDE Gate organisation registration and policy package settings.

---

## How It Works

- Serves the browser web interface (`/register`, `/packages`, `/settings`, `/check`, `/styles.css`).
- Connects to the backend API (`tools/pde-gate-api`) at `PDE_API_URL` (default: `http://127.0.0.1:3847`).
- Allows users to visually register organisations, select a policy profile (Full: every policy for each resource type in the plan; Custom: chosen argument policies per resource type), configure approved regions, and view CI export variables.
- Allows authenticated users to upload Terraform `plan.json`, run the same backend PDE/OPA check used by automation, and review pass/fail results and policy violations.

---

## Quick Start

### 1. Make sure the backend API is running:
```bash
cd tools/pde-gate-api
npm start
```
*(Runs on port 3847)*

### 2. Start the Web Portal:
```bash
cd tools/pde-gate-portal
npm start
```
*(Runs on port 3848)*

### 3. Open in Browser:
- **Registration**: [http://127.0.0.1:3848/register](http://127.0.0.1:3848/register)
- **Package Builder**: [http://127.0.0.1:3848/packages](http://127.0.0.1:3848/packages)
- **Settings**: [http://127.0.0.1:3848/settings](http://127.0.0.1:3848/settings)
- **Run Check**: [http://127.0.0.1:3848/check](http://127.0.0.1:3848/check)

## Portal Workflow

1. Open `/register`, enter the organisation details and a password of at least 12 characters, and optionally import a PDE Gate `package.json`. Registering also signs you in.
2. Store the generated organisation ID and API key securely. The API key is shown only once, with a copy button; it goes into CI as `PDE_API_KEY`. The portal never stores it.
3. Open `/packages` to browse the repository policy catalog (argument policies per resource type), select policies with checkboxes, and create or delete packages without writing JSON.
4. Open `/settings` to load a saved package and update its regions, zones, provider version, or policy selections.
5. Open `/check`, select a saved package, paste the API key (used for that check only, not stored), upload a Terraform plan produced by `terraform show -json`, and choose **Run PDE check**.
6. Review the result: **pass** (every evaluated policy passed), **fail** (the failing policies and their messages), or **check incomplete** (a policy could not be evaluated, or nothing was). Skipped policies and warnings are listed too.

### Signing in

`/packages`, `/settings` and `/check` sign in with the organisation's contact email and password.
That gives a 12-hour session token, kept in the browser tab's `sessionStorage`, which manages
packages. It is not the API key: signing in never changes the key CI uses. The check itself runs
with the API key, as CI does. When the session ends (12 hours, or a 401), the page returns to the
sign-in form; too many sign-in or registration attempts from one address get a "try again in a few
minutes" message (the API's 429).

To replace a lost or leaked key, use **Rotate API key** on `/settings`: it calls
`POST /v1/orgs/:orgId/api-key/rotate`, shows the new key once, and the old key stops working at
once (see `tools/pde-gate/ORG-AND-PROD.md`).

The API key is a secret. Do not commit it or include it in screenshots, reports, or Terraform files.

### Rate limits behind the portal

The API rate-limits register and login per client IP. The portal forwards requests to the API
itself, so it passes the browser's address on in `X-Forwarded-For`. Start the API with
`PDE_TRUST_PROXY=1` (or the portal's address) so it counts each browser separately; without it,
every request through the portal shares one counter.

---

## Environment Variables

| Variable | Default | Purpose |
| :--- | :--- | :--- |
| `PDE_PORTAL_PORT` | `3848` | Port where the portal server runs |
| `PDE_API_URL` | `http://127.0.0.1:3847` | Target URL of the backend `pde-gate-api` server |
