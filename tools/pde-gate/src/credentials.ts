/**
 * Local credential store (~/.pde-gate/credentials.json).
 * Production: written by `pde-gate register` after portal OAuth / token issue.
 * CI: use PDE_ORG_TOKEN env var instead (no local file).
 */

import fs from "node:fs";
import { gateConfigDir, gateConfigPaths, type GateEndpoints, resolveEndpoints } from "./gate-config.js";

export type StoredCredentials = {
    org_id: string;
    token: string;
    registered_at: string;
    portal_url?: string;
    api_url?: string;
};

export function loadStoredCredentials(): StoredCredentials | null {
    const { credentialsFile } = gateConfigPaths();
    if (!fs.existsSync(credentialsFile)) {
        return null;
    }
    const raw = JSON.parse(fs.readFileSync(credentialsFile, "utf8")) as Partial<StoredCredentials>;
    if (!raw.org_id || !raw.token) {
        return null;
    }
    return {
        org_id: String(raw.org_id),
        token: String(raw.token),
        registered_at: String(raw.registered_at ?? new Date().toISOString()),
        portal_url: raw.portal_url ? String(raw.portal_url) : undefined,
        api_url: raw.api_url ? String(raw.api_url) : undefined,
    };
}

export function saveStoredCredentials(
    creds: Omit<StoredCredentials, "registered_at"> & { registered_at?: string },
    endpoints: GateEndpoints = resolveEndpoints()
): string {
    const dir = gateConfigDir();
    fs.mkdirSync(dir, { recursive: true, mode: 0o700 });
    const payload: StoredCredentials = {
        org_id: creds.org_id,
        token: creds.token,
        registered_at: creds.registered_at ?? new Date().toISOString(),
        portal_url: endpoints.portalUrl,
        api_url: endpoints.apiUrl,
    };
    const { credentialsFile } = gateConfigPaths();
    fs.writeFileSync(credentialsFile, JSON.stringify(payload, null, 2) + "\n", { mode: 0o600 });
    return credentialsFile;
}

export function resolveAuthFromEnv(): { orgId: string; token: string } | null {
    const token = process.env.PDE_ORG_TOKEN?.trim();
    const orgId = process.env.PDE_ORG_ID?.trim();
    if (!token || !orgId) {
        return null;
    }
    return { orgId, token };
}
