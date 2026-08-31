#!/usr/bin/env node
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { Command } from "commander";
import { discoverPolicies, findHelpersDir, resourceNamesFromPlan, resourceTypesFromPlan } from "./discover.js";
import { isPolicyFailure, opaEvalMessage } from "./opa.js";
import {
    loadOrgConfig,
    mergePlanWithOrgConfig,
    runRegistrationWizard,
    type OrgConfig,
} from "./org-config.js";
import { filterPoliciesForOrg, validatePolicyBasenames } from "./policy-select.js";
import { formatPlanMetaLine, loadAndNormalisePlan } from "./plan-normalise.js";
import { printJsonReport, printTextReport, toGateReport, type CheckResult } from "./report.js";

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
        "Organisation onboarding popup in the terminal — creates org-config.json with approved regions/zones"
    )
    .option(
        "--output <path>",
        "Where to write org-config.json",
        path.resolve("org-config.json")
    )
    .action(async (opts: { output: string }) => {
        try {
            await runRegistrationWizard(opts.output);
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
        "Registered org allowlists (from pde-gate register). Required for dynamic region/zone policies later."
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
            format: string;
            output?: string;
            strictVersions?: boolean;
            policyProfiles?: string;
        }) => {
            try {
                await runCheck(
                    opts.plan,
                    opts.policies,
                    opts.format,
                    opts.output,
                    opts.orgConfig,
                    opts.strictVersions,
                    opts.policyProfiles
                );
            } catch (err) {
                console.error(err instanceof Error ? err.message : err);
                process.exit(2);
            }
        }
    );

async function runCheck(
    planArg: string,
    policiesArg: string,
    format: string,
    outputPath?: string,
    orgConfigArg?: string,
    strictVersions?: boolean,
    policyProfilesArg?: string
): Promise<void> {
    const planPath = path.resolve(planArg);
    const policiesRoot = path.resolve(policiesArg);

    if (!fs.existsSync(planPath)) {
        throw new Error(`Plan not found: ${planPath}`);
    }
    if (!fs.existsSync(policiesRoot)) {
        throw new Error(`Policies directory not found: ${policiesRoot}`);
    }

    let orgConfig: OrgConfig | null = null;
    if (orgConfigArg) {
        orgConfig = loadOrgConfig(orgConfigArg);
        console.log(
            `PDE_GATE_ORG org_id=${orgConfig.org_id} regions=${orgConfig.approved_regions.join(",")}`
        );
    } else {
        console.log(
            "PDE_GATE_ORG missing — run `pde-gate register` then pass --org-config for dynamic region/zone policies"
        );
    }

    const profilesPath = policyProfilesArg
        ? path.resolve(policyProfilesArg)
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
        strictVersions: Boolean(strictVersions),
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
        throw new Error("No resources found in plan after normalisation (planned_values.root_module.resources)");
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
    if (outputPath) {
        fs.writeFileSync(path.resolve(outputPath), JSON.stringify(report, null, 2) + "\n");
    }
    if (format === "json") {
        printJsonReport(report);
    } else {
        printTextReport(report);
    }
    process.exit(report.summary.failed > 0 ? 1 : 0);
}

program.parseAsync(process.argv);
