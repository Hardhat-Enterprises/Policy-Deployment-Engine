/**
 * Organisation configuration — same JSON schema for file (MVP), portal API (prod), and air-gapped export.
 * Loaded via resolve-org-config.ts (do not call loaders directly from cli.ts).
 */

import fs from "node:fs";
import path from "node:path";
import readline from "node:readline";

/** Optional HashiCorp Terraform constraints for an org (Phase 2). */
export type OrgTerraformConstraints = {
    /** Org's pinned Terraform CLI version; cross-checked against plan.terraform_version. */
    cli_version?: string;
    /** Fallback when plan JSON does not include provider version (required for reliable adoption). */
    google_provider_version?: string;
    /** Org policy: minimum Terraform CLI version. */
    min_version?: string;
    /** Org policy: maximum Terraform CLI version. */
    max_version?: string;
    /** Org policy: allowed google provider versions. */
    allowed_google_provider?: string[];
    /** Optional path to .terraform.lock.hcl for provider detection (FR-67). */
    lock_file?: string;
};

export type OrgConfig = {
    schema_version?: string;
    org_id: string;
    org_name: string;
    registered_at: string;
    approved_regions: string[];
    approved_zones: string[];
    policy_pin: string;
    contact_email: string;
    policy_profile?: string;
    enabled_policies?: Record<string, string[]>;
    enabled_resource_types?: string[];
    enabled_services?: string[];
    /** Optional org-specific Terraform / provider allowlists. */
    terraform?: OrgTerraformConstraints;
};

export type RegistrationAnswers = {
    orgName: string;
    contactEmail: string;
    regions: string[];
    zones: string[];
    policyProfile?: string;
};

const DEFAULT_REGIONS = ["australia-southeast1", "australia-southeast2"];
const DEFAULT_ZONES = ["australia-southeast1-a", "australia-southeast1-b"];

export function slugifyOrgId(name: string): string {
    const base = name
        .trim()
        .toLowerCase()
        .replace(/[^a-z0-9]+/g, "-")
        .replace(/^-+|-+$/g, "");
    const suffix = Math.random().toString(36).slice(2, 6);
    return `${base || "org"}-${suffix}`;
}

export function buildOrgConfig(answers: RegistrationAnswers): OrgConfig {
    return {
        schema_version: "1",
        org_id: slugifyOrgId(answers.orgName),
        org_name: answers.orgName.trim(),
        registered_at: new Date().toISOString(),
        approved_regions: answers.regions,
        approved_zones: answers.zones,
        policy_pin: "main",
        policy_profile: answers.policyProfile ?? "full",
        contact_email: answers.contactEmail.trim(),
    };
}

export function loadOrgConfig(configPath: string): OrgConfig {
    const resolved = path.resolve(configPath);
    if (!fs.existsSync(resolved)) {
        throw new Error(`Org config not found: ${resolved}`);
    }
    const raw = JSON.parse(fs.readFileSync(resolved, "utf8")) as Partial<OrgConfig>;
    return validateOrgConfig(raw, resolved);
}

export function validateOrgConfig(raw: Partial<OrgConfig>, source = "org-config"): OrgConfig {
    if (!raw.org_id || !raw.org_name) {
        throw new Error(`${source}: org_id and org_name are required`);
    }
    if (!Array.isArray(raw.approved_regions) || raw.approved_regions.length === 0) {
        throw new Error(
            `${source}: approved_regions must be a non-empty list. Run: pde-gate register`
        );
    }
    const terraform = raw.terraform as OrgTerraformConstraints | undefined;
    const enabledPolicies = raw.enabled_policies as Record<string, string[]> | undefined;
    return {
        schema_version: String(raw.schema_version ?? "1"),
        org_id: String(raw.org_id),
        org_name: String(raw.org_name),
        registered_at: String(raw.registered_at ?? new Date().toISOString()),
        approved_regions: raw.approved_regions.map(String),
        approved_zones: Array.isArray(raw.approved_zones) ? raw.approved_zones.map(String) : [],
        policy_pin: String(raw.policy_pin ?? "main"),
        policy_profile: raw.policy_profile ? String(raw.policy_profile) : undefined,
        enabled_policies: enabledPolicies
            ? Object.fromEntries(
                  Object.entries(enabledPolicies).map(([k, v]) => [
                      k,
                      Array.isArray(v) ? v.map(String) : [],
                  ])
              )
            : undefined,
        enabled_resource_types: Array.isArray(raw.enabled_resource_types)
            ? raw.enabled_resource_types.map(String)
            : undefined,
        enabled_services: Array.isArray(raw.enabled_services)
            ? raw.enabled_services.map(String)
            : undefined,
        contact_email: String(raw.contact_email ?? ""),
        terraform: terraform
            ? {
                  cli_version: terraform.cli_version ? String(terraform.cli_version) : undefined,
                  google_provider_version: terraform.google_provider_version
                      ? String(terraform.google_provider_version)
                      : undefined,
                  min_version: terraform.min_version ? String(terraform.min_version) : undefined,
                  max_version: terraform.max_version ? String(terraform.max_version) : undefined,
                  allowed_google_provider: Array.isArray(terraform.allowed_google_provider)
                      ? terraform.allowed_google_provider.map(String)
                      : undefined,
                  lock_file: terraform.lock_file ? String(terraform.lock_file) : undefined,
              }
            : undefined,
    };
}

/**
 * Merge org allowlists into the Terraform plan JSON so OPA can read
 * input.org_config.approved_regions (Phase 2 policy wiring).
 */
export function mergePlanWithOrgConfig(plan: unknown, orgConfig: OrgConfig): unknown {
    if (!plan || typeof plan !== "object") {
        throw new Error("Plan must be a JSON object");
    }
    return {
        ...(plan as Record<string, unknown>),
        org_config: {
            org_id: orgConfig.org_id,
            org_name: orgConfig.org_name,
            approved_regions: orgConfig.approved_regions,
            approved_zones: orgConfig.approved_zones,
        },
    };
}

export function writeMergedInput(
    planPath: string,
    orgConfig: OrgConfig,
    outPath: string
): string {
    const plan = JSON.parse(fs.readFileSync(planPath, "utf8"));
    const merged = mergePlanWithOrgConfig(plan, orgConfig);
    const resolved = path.resolve(outPath);
    fs.writeFileSync(resolved, JSON.stringify(merged, null, 2) + "\n");
    return resolved;
}

function ask(rl: readline.Interface, question: string): Promise<string> {
    return new Promise((resolve) => {
        rl.question(question, (answer) => resolve(answer.trim()));
    });
}

function parseList(raw: string, fallback: string[]): string[] {
    if (!raw) return [...fallback];
    return raw
        .split(",")
        .map((s) => s.trim())
        .filter(Boolean);
}

/**
 * Terminal onboarding "popup" — interactive wizard that stands in for the
 * future portal popup until the web UI exists.
 */
export async function runRegistrationWizard(outputPath: string): Promise<OrgConfig> {
    const rl = readline.createInterface({ input: process.stdin, output: process.stdout });

    console.log("");
    console.log("========================================");
    console.log("  PDE Gate — Organisation Registration");
    console.log("  (terminal onboarding popup — Phase 2)");
    console.log("========================================");
    console.log("");
    console.log("This wizard creates org-config.json with your approved");
    console.log("regions/zones. CI later runs: pde-gate check --org-config <file>");
    console.log("");

    try {
        const orgName = await ask(rl, "Organisation name: ");
        if (!orgName) {
            throw new Error("Organisation name is required");
        }

        const contactEmail = await ask(rl, "Contact email: ");
        if (!contactEmail) {
            throw new Error("Contact email is required");
        }

        console.log("");
        console.log(`Approved regions (comma-separated).`);
        console.log(`Press Enter for default: ${DEFAULT_REGIONS.join(", ")}`);
        const regionsRaw = await ask(rl, "Regions: ");
        const regions = parseList(regionsRaw, DEFAULT_REGIONS);

        console.log("");
        console.log(`Approved zones (comma-separated, optional).`);
        console.log(`Press Enter for default: ${DEFAULT_ZONES.join(", ")}`);
        const zonesRaw = await ask(rl, "Zones: ");
        const zones = parseList(zonesRaw, DEFAULT_ZONES);

        console.log("");
        console.log("Policy profile: full (all policies) or baseline (subset).");
        console.log("Press Enter for default: full");
        const policyProfileRaw = await ask(rl, "Policy profile [full|baseline]: ");
        const policyProfile = policyProfileRaw || "full";

        const config = buildOrgConfig({
            orgName,
            contactEmail,
            regions,
            zones,
            policyProfile,
        });

        const resolved = path.resolve(outputPath);
        fs.mkdirSync(path.dirname(resolved), { recursive: true });
        fs.writeFileSync(resolved, JSON.stringify(config, null, 2) + "\n");

        console.log("");
        console.log("----------------------------------------");
        console.log("Registration saved.");
        console.log(`  org_id:  ${config.org_id}`);
        console.log(`  file:    ${resolved}`);
        console.log(`  regions: ${config.approved_regions.join(", ")}`);
        console.log(`  zones:   ${config.approved_zones.join(", ") || "(none)"}`);
        console.log(`  profile: ${config.policy_profile ?? "full"}`);
        console.log("----------------------------------------");
        console.log("");
        console.log("Next (planned CI usage):");
        console.log(
            `  pde-gate check --plan plan.json --policies policies --org-config ${resolved}`
        );
        console.log("");

        return config;
    } finally {
        rl.close();
    }
}
