import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { HttpError } from "../http-error.js";
import {
  isPolicyFailure,
  needsContentAnalysis,
  opaEvalMessage,
  writeJitPolicyDir,
  writeTempInput,
} from "./opa.js";
import { getAdapter, getCanonicalizer, resolvePlatform } from "./plugins/index.js";
import type { PlatformId } from "./plugins/types.js";
import { loadPolicyCatalog, selectPolicies, type PolicyTarget } from "./policy-select.js";

export type CheckStatus = "pass" | "fail" | "error";

type PolicyRef = { policy: string; resource_type: string; argument: string };

export type CheckResult = {
  /** True only for status "pass". */
  ok: boolean;
  status: CheckStatus;
  message: string;
  platform: PlatformId;
  package_id: string;
  warnings: string[];
  failures: (PolicyRef & { message: unknown })[];
  /** Policies that could not be evaluated (OPA error, undefined message). */
  errors: (PolicyRef & { error: string })[];
  /** Policies deliberately not evaluated (content security needs Bandit findings). */
  skipped: (PolicyRef & { reason: string })[];
  /** Policies that produced a pass or a fail. */
  evaluated: number;
  org_config: Record<string, unknown>;
};

/** The parts of a package the evaluation reads. */
export type CheckPackage = {
  package_id: string;
  platforms: string[];
  policy_groups?: Record<string, unknown>;
  variables?: Record<string, unknown>;
};

export type EvaluateInput = {
  pkg: CheckPackage;
  plan: Record<string, unknown>;
  platform?: string;
  strictVersions?: boolean;
  policiesRoot?: string;
};

/** PDE policies/ tree — override with PDE_POLICIES_ROOT in prod. */
export function policiesRoot(): string {
  if (process.env.PDE_POLICIES_ROOT) {
    return path.resolve(process.env.PDE_POLICIES_ROOT);
  }
  const here = path.dirname(fileURLToPath(import.meta.url));
  return path.resolve(here, "../../../../policies");
}

function ref(target: PolicyTarget): PolicyRef {
  return { policy: target.packageName, resource_type: target.resourceType, argument: target.argument };
}

function plural(n: number, one: string, many: string): string {
  return `${n} ${n === 1 ? one : many}`;
}

/**
 * Evaluate a plan against a package's policies. No database: the caller supplies
 * the package. A check that evaluated nothing, or could not evaluate a selected
 * policy, is an error — never a pass.
 */
export async function evaluateCheck(input: EvaluateInput): Promise<CheckResult> {
  const { pkg } = input;
  const root = input.policiesRoot ?? policiesRoot();
  if (!fs.existsSync(root)) {
    throw new Error(`Policies root not found: ${root}. Set PDE_POLICIES_ROOT.`);
  }

  const platform = resolvePlatform(input.plan, input.platform);
  if (!pkg.platforms.includes(platform)) {
    throw new HttpError(
      400,
      `Package platforms=${JSON.stringify(pkg.platforms)} does not include ${platform}`
    );
  }

  const adapter = getAdapter(platform);
  // Fully enforce TF + format + Google provider on hosted checks (opt out: strict_versions: false).
  const strict = input.strictVersions !== false;
  const googleFromPkg =
    typeof pkg.variables?.google_provider_version === "string"
      ? pkg.variables.google_provider_version
      : undefined;
  let canonical;
  let canonicalWarnings: string[];
  try {
    ({ plan: canonical, warnings: canonicalWarnings } = getCanonicalizer(platform).canonicalize(
      input.plan,
      { strict, googleProviderVersion: googleFromPkg }
    ));
  } catch (err: unknown) {
    throw new HttpError(400, err instanceof Error ? err.message : "plan rejected");
  }

  // Package variables.approved_regions / approved_zones → OPA input.org_config
  const withOrg = adapter.mergeOrgConfig(canonical, pkg.variables);
  const orgConfig = (withOrg.org_config ?? {}) as Record<string, unknown>;

  const catalog = loadPolicyCatalog(root, adapter.policiesSubdir());
  const selected = selectPolicies(catalog, adapter.listResourceTypes(withOrg), pkg.policy_groups);
  const warnings = [...canonicalWarnings, ...selected.warnings];

  const helpersDir = path.join(root, "_helpers");
  const inputPath = writeTempInput(withOrg);
  const tempBaseDir = path.dirname(inputPath);
  const failures: CheckResult["failures"] = [];
  const errors: CheckResult["errors"] = [];
  const skipped: CheckResult["skipped"] = [];
  let evaluated = 0;

  try {
    for (const target of selected.targets) {
      if (needsContentAnalysis(target.policyFile)) {
        skipped.push({
          ...ref(target),
          reason: "content-security policy: needs Bandit findings, which this check does not produce",
        });
        continue;
      }
      let message: unknown;
      try {
        const jit = writeJitPolicyDir(target, tempBaseDir, orgConfig);
        warnings.push(...jit.warnings.map((w) => `${target.resourceType}/${target.argument}: ${w}`));
        message = await opaEvalMessage(
          [helpersDir, jit.varsFile, jit.policyFile],
          inputPath,
          target.packageName
        );
      } catch (err: unknown) {
        console.error(`opa eval failed for ${target.packageName}:`, err);
        errors.push({ ...ref(target), error: "OPA evaluation failed" });
        continue;
      }
      if (message === null || message === undefined) {
        errors.push({ ...ref(target), error: `policy message is undefined (package ${target.packageName})` });
        continue;
      }
      evaluated += 1;
      if (isPolicyFailure(message)) failures.push({ ...ref(target), message });
    }
  } finally {
    fs.rmSync(tempBaseDir, { recursive: true, force: true });
  }

  let status: CheckStatus;
  let message: string;
  if (evaluated === 0 && errors.length === 0 && skipped.length === 0) {
    status = "error";
    message = "No PDE policies matched this plan, so nothing was evaluated; a check that evaluates nothing cannot pass.";
  } else if (errors.length > 0 || skipped.length > 0) {
    status = "error";
    const parts = [];
    if (errors.length > 0) parts.push(`${plural(errors.length, "policy", "policies")} could not be evaluated`);
    if (skipped.length > 0) {
      parts.push(`${plural(skipped.length, "content-security policy", "content-security policies")} not evaluated (Bandit findings needed)`);
    }
    message = `Check incomplete: ${parts.join("; ")}.`;
  } else if (failures.length > 0) {
    status = "fail";
    message = `${plural(failures.length, "policy", "policies")} failed out of ${evaluated} evaluated.`;
  } else {
    status = "pass";
    message = `All ${plural(evaluated, "policy", "policies")} passed.`;
  }

  return {
    ok: status === "pass",
    status,
    message,
    platform,
    package_id: pkg.package_id,
    warnings: [...new Set(warnings)],
    failures,
    errors,
    skipped,
    evaluated,
    org_config: orgConfig,
  };
}
