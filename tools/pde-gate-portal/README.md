# PDE Gate Web Portal (`tools/pde-gate-portal`)

Web Portal frontend for PDE Gate organisation registration and policy package settings.

---

## How It Works

- Serves the browser web interface (`/register`, `/settings`, `/styles.css`).
- Connects to the backend API (`tools/pde-gate-api`) at `PDE_API_URL` (default: `http://127.0.0.1:3847`).
- Allows users to visually register organisations, select policy profiles (Full, Baseline, Custom), configure approved regions, and view CI export variables.

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
- **Settings**: [http://127.0.0.1:3848/settings](http://127.0.0.1:3848/settings)

---

## Environment Variables

| Variable | Default | Purpose |
| :--- | :--- | :--- |
| `PDE_PORTAL_PORT` | `3848` | Port where the portal server runs |
| `PDE_API_URL` | `http://127.0.0.1:3847` | Target URL of the backend `pde-gate-api` server |
