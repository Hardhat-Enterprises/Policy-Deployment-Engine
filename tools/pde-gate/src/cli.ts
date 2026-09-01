#!/usr/bin/env node
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { Command } from "commander";
import { discoverPolicies, findHelpersDir, resourceNamesFromPlan, resourceTypesFromPlan } from "./discover.js";
import { isPolicyFailure, opaEvalMessage } from "./opa.js";
import { mergePlanWithOrgConfig, runRegistrationWizard } from "./org-config.js";
import { runPortalRegistration } from "./portal-register.js";
import { filterPoliciesForOrg, validatePolicyBasenames } from "./policy-select.js";
import { formatPlanMetaLine, loadAndNormalisePlan } from "./plan-normalise.js";
import { printJsonReport, printTextReport, toGateReport, type CheckResult } from "./report.js";
import { resolveOrgConfig } from "./resolve-org-config.js";
import { printStatus, runStatus, shouldRequireOrgConfig } from "./status.js";

const DEFAULT_PROFILES_PATH = path.join(
    path.dirname(fileURLToPath(import.meta.url)),
    "..",
    "policy-profiles.json"
);

const program = new Command();

program
    .name("pde-gate")
    .description("Run PDE OPA policies against a Terraform plan JSON");

program
    .command("register")
    .description(
        "Register organisation — portal (production) or file wizard (MVP / air-gapped)"
    )
    .option(
        "--mode <mode>",
        "portal: open browser + save token | file: terminal wizard → org-config.json",
        "file"
    )
    .option(
        "--output <path>",
        "Where to write org-config.json (file mode only)",
        path.resolve("org-config.json")
    )
    .action(async (opts: { mode: string; output: string }) => {
        try {
            if (opts.mode === "portal") {
                await runPortalRegistration();
            } else if (opts.mode === "file") {
                await runRegistrationWizard(opts.output);
            } else {
                throw new Error(`Unknown register mode "${opts.mode}". Use: portal | file`);
            }
            process.exit(0);
        } catch (err) {
            console.error(err instanceof Error ? err.message : err);
            process.exit(2);
        }
    });

program
    .command("status")
    .description("Verify portal connection and show organisation config (production)")
    .option("--org-config <path>", "Org config file (MVP / air-gapped)")
    .option("--org-id <id>", "Organisation ID — uses PDE_ORG_TOKEN or ~/.pde-gate/credentials.json")
    .action(async (opts: { orgConfig?: string; orgId?: string }) => {
        try {
            const resolved = await runStatus({
                orgConfigPath: opts.orgConfig,
                orgId: opts.orgId,
            });
            printStatus(resolved);
            process.exit(0);
        } catch (err) {
            console.error(err instanceof Error ? err.message : err);
            process.exit(2);
        }
    });

program
    .command("check")
    .requiredOption("--plan <path>", "Terraform plan JSON (terraform show -json)")
    .requiredOption("--policies <path>", "PDE policies/ directory")
    .option(
        "--org-config <path>",
        "Org config file (MVP / air-gapped). Same JSON shape as portal API returns."
    )
    .option(
        "--org-id <id>",
        "Organisation ID — fetches config from portal API using PDE_ORG_TOKEN"
    )
    .option(
        "--require-org-config",
        "Fail if no org config (file, API token, or ~/.pde-gate/credentials.json)"
    )
    .option("--format <fmt>", "text (CI grep lines) or json", "text")
    .option("--output <path>", "Write JSON report to this file")
    .option(
        "--strict-versions",
        "Fail when Terraform / plan format / provider version is outside the PDE support matrix"
    )
    .option(
        "--policy-profiles <path>",
        "JSON file with named policy profiles (default: tools/pde-gate/policy-profiles.json)"
    )
    .action(
        async (opts: {
            plan: string;
            policies: string;
            orgConfig?: string;
            orgId?: string;
            requireOrgConfig?: boolean;
            format: string;
            output?: string;
            strictVersions?: boolean;
            policyProfiles?: string;
        }) => {
            try {
                await runCheck(opts);
            } catch (err) {
                console.error(err instanceof Error ? err.message : err);
                process.exit(2);
            }
        }
    );

type CheckOpts = {
    plan: string;
    policies: string;
    orgConfig?: string;
    orgId?: string;
    requireOrgConfig?: boolean;
    format: string;
    output?: string;
    strictVersions?: boolean;
    policyProfiles?: string;
};

async function runCheck(opts: CheckOpts): Promise<void> {
    const planPath = path.resolve(opts.plan);
    const policiesRoot = path.resolve(opts.policies);

    if (!fs.existsSync(planPath)) {
        throw new Error(`Plan not found: ${planPath}`);
    }
    if (!fs.existsSync(policiesRoot)) {
        throw new Error(`Policies directory not found: ${policiesRoot}`);
    }

    const resolved = await resolveOrgConfig({
        orgConfigPath: opts.orgConfig,
        orgId: opts.orgId,
        requireOrgConfig: shouldRequireOrgConfig(opts),
    });

    const orgConfig = resolved?.config ?? null;
    if (resolved) {
        console.log(
            `PDE_GATE_ORG source=${resolved.source} org_id=${resolved.config.org_id} regions=${resolved.config.approved_regions.join(",")}`
        );
    } else {
        console.log(
            "PDE_GATE_ORG missing — run `pde-gate register` or pass --org-config / --org-id + PDE_ORG_TOKEN"
        );
    }

    const profilesPath = opts.policyProfiles
        ? path.resolve(opts.policyProfiles)
        : DEFAULT_PROFILES_PATH;

    if (orgConfig) {
        for (const warning of validatePolicyBasenames(
            discoverPolicies(policiesRoot),
            orgConfig
        )) {
            console.log(`PDE_GATE_WARN ${warning}`);
        }
    }

    const { plan, meta, warnings } = loadAndNormalisePlan(planPath, {
        orgConfig,
        strictVersions: Boolean(opts.strictVersions),
    });
    console.log(`PDE_GATE_TF ${formatPlanMetaLine(meta)}`);
    for (const warning of warnings) {
        console.log(`PDE_GATE_WARN ${warning}`);
    }

    let opaInput = plan;
    if (orgConfig) {
        opaInput = mergePlanWithOrgConfig(plan, orgConfig) as Record<string, unknown>;
    }

    const tmp = path.join(os.tmpdir(), `pde-gate-input-${process.pid}.json`);
    fs.writeFileSync(tmp, JSON.stringify(opaInput, null, 2) + "\n");
    const opaInputPath = tmp;

    const helpersDir = findHelpersDir(policiesRoot);
    const typesInPlan = resourceTypesFromPlan(opaInput);
    if (typesInPlan.size === 0) {
        fs.unlinkSync(opaInputPath);
        throw new Error(
            "No resources found in plan after normalisation (planned_values.root_module.resources)"
        );
    }

    const all = discoverPolicies(policiesRoot);
    const applicable = filterPoliciesForOrg(
        all.filter((p) => typesInPlan.has(p.resourceType)),
        policiesRoot,
        orgConfig,
        profilesPath
    );
    if (applicable.length === 0) {
        fs.unlinkSync(opaInputPath);
        console.log("No PDE policies match resource types in this plan.");
        console.log("Types in plan:", [...typesInPlan].join(", "));
        process.exit(0);
    }

    const results: CheckResult[] = [];
    for (const policy of applicable) {
        const message = await opaEvalMessage(helpersDir, policy.dir, opaInputPath, policy.packageName);
        results.push({
            policy: policy.packageName,
            resourceType: policy.resourceType,
            status: isPolicyFailure(message) ? "FAILED" : "PASSED",
            message,
            resourceNames: resourceNamesFromPlan(opaInput, policy.resourceType),
        });
    }

    if (fs.existsSync(opaInputPath)) {
        fs.unlinkSync(opaInputPath);
    }

    const report = toGateReport(results);
    if (opts.output) {
        fs.writeFileSync(path.resolve(opts.output), JSON.stringify(report, null, 2) + "\n");
    }
    if (opts.format === "json") {
        printJsonReport(report);
    } else {
        printTextReport(report);
    }
    process.exit(report.summary.failed > 0 ? 1 : 0);
}

program.parseAsync(process.argv);
