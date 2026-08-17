#!/usr/bin/env node
import fs from "node:fs";
import path from "node:path";
import { Command } from "commander";
import { discoverPolicies, findHelpersDir, resourceNamesInPlan, resourceTypesInPlan } from "./discover.js";
import { isPolicyFailure, opaEvalMessage } from "./opa.js";
import { printJsonReport, printTextReport, toGateReport, type CheckResult } from "./report.js";

const program = new Command();

program.name("pde-gate").description("Run PDE OPA policies against a Terraform plan JSON");

program
    .command("check")
    .requiredOption("--plan <path>", "Terraform plan JSON (terraform show -json)")
    .requiredOption("--policies <path>", "PDE policies/ directory")
    .option("--format <fmt>", "text (CI grep lines) or json", "text")
    .option("--output <path>", "Write JSON report to this file")
    .action(async (opts: { plan: string; policies: string; format: string; output?: string }) => {
        try {
            await runCheck(opts.plan, opts.policies, opts.format, opts.output);
        } catch (err) {
            console.error(err instanceof Error ? err.message : err);
            process.exit(2);
        }
    });

async function runCheck(
    planArg: string,
    policiesArg: string,
    format: string,
    outputPath?: string
): Promise<void> {
    const planPath = path.resolve(planArg);
    const policiesRoot = path.resolve(policiesArg);

    if (!fs.existsSync(planPath)) {
        throw new Error(`Plan not found: ${planPath}`);
    }
    if (!fs.existsSync(policiesRoot)) {
        throw new Error(`Policies directory not found: ${policiesRoot}`);
    }

    const helpersDir = findHelpersDir(policiesRoot);
    const typesInPlan = resourceTypesInPlan(planPath);
    if (typesInPlan.size === 0) {
        throw new Error("No resources found in plan.json planned_values.root_module.resources");
    }

    const all = discoverPolicies(policiesRoot);
    const applicable = all.filter((p) => typesInPlan.has(p.resourceType));
    if (applicable.length === 0) {
        console.log("No PDE policies match resource types in this plan.");
        console.log("Types in plan:", [...typesInPlan].join(", "));
        process.exit(0);
    }

    const results: CheckResult[] = [];
    for (const policy of applicable) {
        const message = await opaEvalMessage(helpersDir, policy.dir, planPath, policy.packageName);
        results.push({
            policy: policy.packageName,
            resourceType: policy.resourceType,
            status: isPolicyFailure(message) ? "FAILED" : "PASSED",
            message,
            resourceNames: resourceNamesInPlan(planPath, policy.resourceType),
        });
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
