import fs from "node:fs";
import path from "node:path";
import type { PolicyTarget } from "./discover.js";
import type { OrgConfig } from "./org-config.js";

export type PolicyProfile = {
    enabled_policies?: Record<string, string[]>;
    enabled_resource_types?: string[];
    enabled_services?: string[];
};

export type PolicyProfilesFile = Record<string, PolicyProfile>;

export function policyBasename(policyFile: string): string {
    return path.basename(policyFile, ".rego");
}

/** GCP service folder name under policies/gcp/, e.g. "Serverless VPC Access". */
export function serviceFromPolicy(policy: PolicyTarget, policiesRoot: string): string | null {
    const gcpRoot = path.join(policiesRoot, "gcp");
    const rel = path.relative(gcpRoot, policy.dir);
    if (rel.startsWith("..")) return null;
    const segment = rel.split(path.sep)[0];
    return segment || null;
}

export function loadPolicyProfiles(profilesPath: string): PolicyProfilesFile {
    const resolved = path.resolve(profilesPath);
    if (!fs.existsSync(resolved)) {
        throw new Error(`Policy profiles file not found: ${resolved}`);
    }
    const raw = JSON.parse(fs.readFileSync(resolved, "utf8")) as PolicyProfilesFile;
    if (!raw || typeof raw !== "object") {
        throw new Error(`${resolved}: policy profiles must be a JSON object`);
    }
    return raw;
}

function hasActiveSelection(selection: PolicyProfile): boolean {
    if (selection.enabled_policies && Object.keys(selection.enabled_policies).length > 0) {
        return true;
    }
    if (selection.enabled_resource_types?.length) {
        return true;
    }
    if (selection.enabled_services?.length) {
        return true;
    }
    return false;
}

function resolveProfileSelection(
    orgConfig: OrgConfig,
    profilesPath: string
): PolicyProfile | null {
    if (orgConfig.enabled_policies && Object.keys(orgConfig.enabled_policies).length > 0) {
        return {
            enabled_policies: orgConfig.enabled_policies,
            enabled_resource_types: orgConfig.enabled_resource_types,
            enabled_services: orgConfig.enabled_services,
        };
    }

    if (orgConfig.policy_profile && orgConfig.policy_profile !== "custom") {
        const profiles = loadPolicyProfiles(profilesPath);
        const profile = profiles[orgConfig.policy_profile];
        if (!profile) {
            throw new Error(
                `Unknown policy_profile "${orgConfig.policy_profile}". Available: ${Object.keys(profiles).join(", ")}`
            );
        }
        return hasActiveSelection(profile) ? profile : null;
    }

    if (orgConfig.enabled_resource_types?.length || orgConfig.enabled_services?.length) {
        return {
            enabled_resource_types: orgConfig.enabled_resource_types,
            enabled_services: orgConfig.enabled_services,
        };
    }

    return null;
}

function matchesEnabledPolicies(policy: PolicyTarget, enabled: Record<string, string[]>): boolean {
    const forType = enabled[policy.resourceType];
    if (!forType || forType.length === 0) {
        return true;
    }
    return forType.includes(policyBasename(policy.file));
}

/**
 * Filter discovered policies using org-config selection rules (§4A.6).
 * Returns all policies when no selection fields are set.
 */
export function filterPoliciesForOrg(
    policies: PolicyTarget[],
    policiesRoot: string,
    orgConfig: OrgConfig | null,
    profilesPath: string
): PolicyTarget[] {
    if (!orgConfig) {
        return policies;
    }

    const selection = resolveProfileSelection(orgConfig, profilesPath);
    if (!selection) {
        return policies;
    }

    if (selection.enabled_policies && Object.keys(selection.enabled_policies).length > 0) {
        return policies.filter((p) => matchesEnabledPolicies(p, selection.enabled_policies!));
    }

    if (selection.enabled_resource_types?.length) {
        const allowed = new Set(selection.enabled_resource_types);
        return policies.filter((p) => allowed.has(p.resourceType));
    }

    if (selection.enabled_services?.length) {
        const allowed = new Set(selection.enabled_services);
        return policies.filter((p) => {
            const service = serviceFromPolicy(p, policiesRoot);
            return service ? allowed.has(service) : false;
        });
    }

    return policies;
}

export function validatePolicyBasenames(
    policies: PolicyTarget[],
    orgConfig: OrgConfig
): string[] {
    const warnings: string[] = [];
    const enabled = orgConfig.enabled_policies;
    if (!enabled) return warnings;

    const byType = new Map<string, Set<string>>();
    for (const policy of policies) {
        const set = byType.get(policy.resourceType) ?? new Set<string>();
        set.add(policyBasename(policy.file));
        byType.set(policy.resourceType, set);
    }

    for (const [resourceType, basenames] of Object.entries(enabled)) {
        const known = byType.get(resourceType);
        if (!known) {
            warnings.push(
                `enabled_policies references resource type "${resourceType}" but no policies were discovered for it`
            );
            continue;
        }
        for (const basename of basenames) {
            if (!known.has(basename)) {
                warnings.push(
                    `enabled_policies.${resourceType} includes unknown policy "${basename}"`
                );
            }
        }
    }

    return warnings;
}
