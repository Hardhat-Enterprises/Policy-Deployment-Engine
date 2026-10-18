import fs from "node:fs";
import os from "node:os";
import path from "node:path";

/**
 * api_key (PDE_API_KEY) runs checks; session_token (from login, 12h) manages the
 * org and its packages. Login never replaces the api_key.
 */
export type Credentials = {
  org_id: string;
  api_key?: string;
  session_token?: string;
  session_expires_at?: string;
  api_url?: string;
};

/** Load .env files from CWD or workspace root if present */
export function loadDotEnv(): void {
  const possiblePaths = [
    path.join(process.cwd(), ".env"),
    path.join(process.cwd(), "..", ".env"),
    path.join(process.cwd(), "..", "..", ".env"),
  ];
  for (const envPath of possiblePaths) {
    if (fs.existsSync(envPath)) {
      try {
        const content = fs.readFileSync(envPath, "utf8");
        for (const line of content.split("\n")) {
          const trimmed = line.trim();
          if (!trimmed || trimmed.startsWith("#")) continue;
          const eq = trimmed.indexOf("=");
          if (eq > 0) {
            const key = trimmed.slice(0, eq).trim();
            let val = trimmed.slice(eq + 1).trim();
            if (
              (val.startsWith('"') && val.endsWith('"')) ||
              (val.startsWith("'") && val.endsWith("'"))
            ) {
              val = val.slice(1, -1);
            }
            if (!process.env[key]) {
              process.env[key] = val;
            }
          }
        }
      } catch {
        // ignore
      }
    }
  }
}

// Automatically load .env on import
loadDotEnv();

export function credentialsPath(): string {
  return process.env.PDE_CREDENTIALS_FILE || path.join(os.homedir(), ".pde-gate", "credentials.json");
}

export function loadCredentials(): Credentials | null {
  loadDotEnv();
  const p = credentialsPath();
  if (!fs.existsSync(p)) return null;
  return JSON.parse(fs.readFileSync(p, "utf8")) as Credentials;
}

export function saveCredentials(creds: Credentials): void {
  const p = credentialsPath();
  fs.mkdirSync(path.dirname(p), { recursive: true });
  fs.writeFileSync(p, JSON.stringify(creds, null, 2) + "\n", { mode: 0o600 });
}

function resolveOrg(file: Credentials | null): { org_id?: string; api_url: string } {
  return {
    org_id: process.env.PDE_ORG_ID || file?.org_id,
    api_url: process.env.PDE_API_URL || file?.api_url || "http://127.0.0.1:3847",
  };
}

/** Org + API key, for checks. */
export function resolveAuth(): { org_id: string; api_key: string; api_url: string } {
  loadDotEnv();
  const file = loadCredentials();
  const { org_id, api_url } = resolveOrg(file);
  const api_key =
    process.env.PDE_API_KEY || process.env.PDE_ORG_TOKEN || file?.api_key;
  if (!org_id || !api_key) {
    throw new Error(
      "Missing org credentials. Run `pde-gate register` or set PDE_ORG_ID + PDE_API_KEY in .env or environment."
    );
  }
  return { org_id, api_key, api_url };
}

/** Org + session token, for managing the org and its packages. */
export function resolveSession(): { org_id: string; session_token: string; api_url: string } {
  loadDotEnv();
  const file = loadCredentials();
  const { org_id, api_url } = resolveOrg(file);
  const session_token = process.env.PDE_SESSION_TOKEN || file?.session_token;
  const expired =
    !process.env.PDE_SESSION_TOKEN &&
    file?.session_expires_at !== undefined &&
    Date.parse(file.session_expires_at) <= Date.now();
  if (!org_id || !session_token || expired) {
    throw new Error(
      `${expired ? "Session expired" : "No session"}. Run \`pde-gate login --email <email>\` (sessions last 12 hours).`
    );
  }
  return { org_id, session_token, api_url };
}
