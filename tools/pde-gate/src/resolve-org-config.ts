/**
 * Unified org-config resolution — scalable entry point for all adoption modes.
 *
 * Priority:
 *   1. --org-config <file>           (MVP / air-gapped / on-prem file export)
 *   2. --org-id + PDE_ORG_TOKEN      (production CI)
 *   3. --org-id + ~/.pde-gate/credentials.json  (local dev after register)
 *
 * Portal returns the same OrgConfig schema as the file — policy-select and OPA unchanged.
 */

import { loadStoredCredentials, resolveAuthFromEnv } from "./credentials.js";
import { resolveEndpoints } from "./gate-config.js";
import { loadOrgConfig, type OrgConfig } from "./org-config.js";
import { fetchOrgConfigFromApi } from "./portal-client.js";

export type OrgConfigSource = "file" | "portal-api" | "local-credentials";

export type ResolvedOrgConfig = {
    config: OrgConfig;
    source: OrgConfigSource;
};

export type ResolveOrgConfigInput = {
    orgConfigPath?: string;
    orgId?: string;
    /** When true, check requires org config (production default). */
    requireOrgConfig?: boolean;
};

export async function resolveOrgConfig(input: ResolveOrgConfigInput): Promise<ResolvedOrgConfig | null> {
    if (input.orgConfigPath) {
        return {
            config: loadOrgConfig(input.orgConfigPath),
            source: "file",
        };
    }

    const envAuth = resolveAuthFromEnv();
    const orgId = input.orgId ?? envAuth?.orgId;
    let token = envAuth?.token;

    if (!token && orgId) {
        const stored = loadStoredCredentials();
        if (stored && stored.org_id === orgId) {
            token = stored.token;
        }
    }

    if (!token && !orgId) {
        const stored = loadStoredCredentials();
        if (stored) {
            return {
                config: await fetchOrgConfigFromApi({
                    orgId: stored.org_id,
                    token: stored.token,
                    endpoints: resolveEndpoints({
                        apiUrl: stored.api_url,
                        portalUrl: stored.portal_url,
                    }),
                }),
                source: "local-credentials",
            };
        }
    }

    if (orgId && token) {
        return {
            config: await fetchOrgConfigFromApi({
                orgId,
                token,
                endpoints: resolveEndpoints(),
            }),
            source: "portal-api",
        };
    }

    if (input.requireOrgConfig) {
        throw new Error(
            "Organisation config required. Register first (pde-gate register), then use --org-id + PDE_ORG_TOKEN (CI) or --org-config <file> (air-gapped)."
        );
    }

    return null;
}
