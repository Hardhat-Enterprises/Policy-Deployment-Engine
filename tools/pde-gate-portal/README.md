# PDE Gate Web Portal (`tools/pde-gate-portal`)

Web Portal frontend for PDE Gate organisation registration and policy package settings.

---

## How It Works

- Serves the browser web interface (`/register`, `/packages`, `/settings`, `/check`, `/styles.css`).
- Connects to the backend API (`tools/pde-gate-api`) at `PDE_API_URL` (default: `http://127.0.0.1:3847`).
- Allows users to visually register organisations, select policy profiles (Full, Baseline, Custom), configure approved regions, and view CI export variables.
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

1. Open `/register`, enter the organisation details, and optionally import a PDE Gate `package.json`.
2. Store the generated organisation ID and API key securely.
3. Open `/packages` to browse the repository policy catalog, select policies with checkboxes, and create or delete packages without writing JSON.
4. Open `/settings` to load a saved package and update its regions, zones, provider version, or policy selections.
5. Open `/check`, select a saved package, upload a Terraform plan produced by `terraform show -json`, and choose **Run PDE check**.
6. Review the evaluated-policy count, warnings, organisation configuration and any policy violations. A green result means no selected policy reported a violation; a red result lists the failing policies and messages.

The API key is a secret. Do not commit it or include it in screenshots, reports, or Terraform files.

---

## Environment Variables

| Variable | Default | Purpose |
| :--- | :--- | :--- |
| `PDE_PORTAL_PORT` | `3848` | Port where the portal server runs |
| `PDE_API_URL` | `http://127.0.0.1:3847` | Target URL of the backend `pde-gate-api` server |
