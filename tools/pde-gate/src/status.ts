import { resolveAuthFromEnv } from "./credentials.js";
import type { OrgConfig } from "./org-config.js";
import { resolveOrgConfig, type OrgConfigSource } from "./resolve-org-config.js";

export type StatusResult = {
    config: OrgConfig;
    source: OrgConfigSource;
};

export async function runStatus(opts: {
    orgConfigPath?: string;
    orgId?: string;
}): Promise<StatusResult> {
    const resolved = await resolveOrgConfig({
        orgConfigPath: opts.orgConfigPath,
        orgId: opts.orgId,
        requireOrgConfig: true,
    });

    if (!resolved) {
        throw new Error("No organisation config found");
    }

    return resolved;
}

export function printStatus(resolved: StatusResult): void {
    const { config, source } = resolved;
    console.log(`PDE_GATE_STATUS source=${source} ok=true`);
    console.log(`  org_id:          ${config.org_id}`);
    console.log(`  org_name:        ${config.org_name}`);
    console.log(`  policy_profile:  ${config.policy_profile ?? "full"}`);
    console.log(`  approved_regions: ${config.approved_regions.join(", ")}`);
    if (config.approved_zones?.length) {
        console.log(`  approved_zones:  ${config.approved_zones.join(", ")}`);
    }
    if (config.enabled_policies && Object.keys(config.enabled_policies).length > 0) {
        console.log(`  enabled_policies: ${JSON.stringify(config.enabled_policies)}`);
    }
}

export function shouldRequireOrgConfig(opts: {
    orgConfigPath?: string;
    orgId?: string;
    requireOrgConfig?: boolean;
}): boolean {
    if (opts.requireOrgConfig) {
        return true;
    }
    if (opts.orgConfigPath) {
        return false;
    }
    if (opts.orgId || resolveAuthFromEnv()) {
        return true;
    }
    return false;
}
