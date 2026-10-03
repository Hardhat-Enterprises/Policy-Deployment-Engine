import path from "node:path";
import { fileURLToPath } from "node:url";
import { getPackage } from "../store.js";
import { isPolicyFailure, opaEvalMessage, writeTempInput } from "./opa.js";
import { getAdapter, getCanonicalizer, resolvePlatform } from "./plugins/index.js";
import type { PlatformId } from "./plugins/types.js";
import { discoverPolicies, readRegoPackage } from "./policy-select.js";
import fs from "node:fs";

export type ServerCheckInput = {
  orgId: string;
  packageId: string;
  plan: Record<string, unknown>;
  platform?: string;
  strictVersions?: boolean;
};

export type ServerCheckResult = {
  ok: boolean;
  platform: PlatformId;
  package_id: string;
  warnings: string[];
  failures: { policy: string; message: unknown }[];
  evaluated: number;
  org_config: Record<string, unknown>;
};

export function policiesRoot(): string {
  if (process.env.PDE_POLICIES_ROOT) {
    return path.resolve(process.env.PDE_POLICIES_ROOT);
  }
  const here = path.dirname(fileURLToPath(import.meta.url));
  return path.resolve(here, "../../../../policies");
}

export async function runServerCheck(input: ServerCheckInput): Promise<ServerCheckResult> {
  const pkg = await getPackage(input.orgId, input.packageId);
  if (!pkg) {
    const err = new Error("package not found") as Error & { status: number };
    err.status = 404;
    throw err;
  }

  const root = policiesRoot();
  if (!fs.existsSync(root)) {
    throw new Error(`Policies root not found: ${root}. Set PDE_POLICIES_ROOT.`);
  }

  const platform = resolvePlatform(input.plan, input.platform);
  if (!pkg.platforms.includes(platform)) {
    const err = new Error(
      `Package platforms=${JSON.stringify(pkg.platforms)} does not include ${platform}`
    ) as Error & { status: number };
    err.status = 400;
    throw err;
  }

  const adapter = getAdapter(platform);
  const strict = input.strictVersions !== false;
  const googleFromPkg =
    typeof pkg.variables?.google_provider_version === "string"
      ? pkg.variables.google_provider_version
      : undefined;
  let canonical;
  let warnings: string[];
  try {
    ({ plan: canonical, warnings } = getCanonicalizer(platform).canonicalize(input.plan, {
      strict,
      googleProviderVersion: googleFromPkg,
    }));
  } catch (err: unknown) {
    const e = err as Error & { status?: number };
    e.status = 400;
    throw e;
  }

  const withOrg = adapter.mergeOrgConfig(canonical, pkg.variables);
  const org_config = (withOrg.org_config ?? {}) as Record<string, unknown>;

  const types = new Set(adapter.listResourceTypes(withOrg));
  const helpersDir = path.join(root, "_helpers");
  const targets = discoverPolicies(root, adapter.policiesSubdir(), types, pkg.policy_groups);

  const inputPath = writeTempInput(withOrg);
  const failures: ServerCheckResult["failures"] = [];
  let evaluated = 0;

  try {
    for (const target of targets) {
      for (const policyFile of target.policyFiles) {
        const packageName = readRegoPackage(policyFile);
        evaluated += 1;
        const message = await opaEvalMessage(helpersDir, target.dir, inputPath, packageName);
        if (isPolicyFailure(message)) {
          failures.push({ policy: packageName, message });
        }
      }
    }
  } finally {
    fs.rmSync(path.dirname(inputPath), { recursive: true, force: true });
  }

  return {
    ok: failures.length === 0,
    platform,
    package_id: pkg.package_id,
    warnings,
    failures,
    evaluated,
    org_config,
  };
}
