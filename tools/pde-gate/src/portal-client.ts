/**
 * Portal Config API client (production).
 * Fetches the same OrgConfig JSON shape as org-config.json — no rebuild when portal ships.
 */

import type { GateEndpoints } from "./gate-config.js";
import { validateOrgConfig, type OrgConfig } from "./org-config.js";

export type FetchOrgConfigOptions = {
    orgId: string;
    token: string;
    endpoints: GateEndpoints;
};

export class PortalAuthError extends Error {
    constructor(message: string) {
        super(message);
        this.name = "PortalAuthError";
    }
}

export class PortalUnavailableError extends Error {
    constructor(message: string) {
        super(message);
        this.name = "PortalUnavailableError";
    }
}

function healthUrl(endpoints: GateEndpoints): string {
    const base = endpoints.apiUrl.replace(/\/$/, "");
    return `${base}/health`;
}

function configUrl(endpoints: GateEndpoints, orgId: string): string {
    const base = endpoints.apiUrl.replace(/\/$/, "");
    return `${base}/v1/orgs/${encodeURIComponent(orgId)}/config`;
}

/**
 * Verify the portal API is running before opening the browser.
 */
export async function assertPortalReachable(endpoints: GateEndpoints): Promise<void> {
    const url = healthUrl(endpoints);
    try {
        const response = await fetch(url, { method: "GET" });
        if (!response.ok) {
            throw new PortalUnavailableError(`Portal health check failed (${response.status}) at ${url}`);
        }
    } catch (err) {
        if (err instanceof PortalUnavailableError) {
            throw err;
        }
        const detail = err instanceof Error ? err.message : String(err);
        throw new PortalUnavailableError(
            `Portal not reachable at ${url}.\n` +
                `Start it first:\n` +
                `  cd tools/pde-gate-portal && npm install && npm start\n` +
                `Then set:\n` +
                `  export PDE_API_URL=http://localhost:3847\n` +
                `  export PDE_PORTAL_URL=http://localhost:3847\n` +
                `(${detail})`
        );
    }
}

/**
 * Fetch org configuration from the portal API.
 * Token is validated server-side; response is full org config (regions, enabled_policies, etc.).
 */
export async function fetchOrgConfigFromApi(options: FetchOrgConfigOptions): Promise<OrgConfig> {
    const url = configUrl(options.endpoints, options.orgId);
    let response: Response;
    try {
        response = await fetch(url, {
            method: "GET",
            headers: {
                Authorization: `Bearer ${options.token}`,
                Accept: "application/json",
            },
        });
    } catch (err) {
        const detail = err instanceof Error ? err.message : String(err);
        throw new PortalUnavailableError(
            `Could not reach portal API at ${url}. For offline CI use --org-config instead. (${detail})`
        );
    }

    if (response.status === 401 || response.status === 403) {
        throw new PortalAuthError(
            "Invalid or expired PDE_ORG_TOKEN for this org_id. Re-run: pde-gate register"
        );
    }

    if (!response.ok) {
        const body = await response.text();
        throw new PortalUnavailableError(
            `Portal API returned ${response.status} for ${url}. ${body.slice(0, 200)}`
        );
    }

    const raw = (await response.json()) as Record<string, unknown>;
    return validateOrgConfig(raw, `portal:${options.orgId}`);
}
