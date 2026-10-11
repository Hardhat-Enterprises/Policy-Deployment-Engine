import fs from "node:fs";
import path from "node:path";
import { getPackage } from "../api-client.js";
import { resolveAuth } from "../credentials.js";
import { isPolicyFailure, opaEvalMessage, writeTempInput } from "../opa.js";
import { getAdapter, getCanonicalizer, resolvePlatform } from "../plugins/index.js";
import type { PlatformId } from "../plugins/types.js";
import { discoverPolicies, readRegoPackage } from "../policy-select.js";

export type CheckOptions = {
  planPath: string;
  packageId: string;
  policiesRoot: string;
  platform?: string;
  strictVersions?: boolean;
};

export type CheckResult = {
  ok: boolean;
  platform: PlatformId;
  package_id: string;
  warnings: string[];
  failures: { policy: string; message: unknown }[];
  evaluated: number;
};

export async function runCheck(opts: CheckOptions): Promise<CheckResult> {
  const auth = resolveAuth();
  const pkg = await getPackage(auth.api_url, auth.org_id, auth.api_key, opts.packageId);

  const raw = JSON.parse(fs.readFileSync(opts.planPath, "utf8")) as Record<string, unknown>;
  const platform = resolvePlatform(raw, opts.platform);
  if (!pkg.platforms.includes(platform)) {
    throw new Error(
      `Package ${pkg.package_id} platforms=${JSON.stringify(pkg.platforms)} does not include ${platform}`
    );
  }

  const adapter = getAdapter(platform);
  const { plan: canonical, warnings } = getCanonicalizer(platform).canonicalize(raw, {
    strict: opts.strictVersions,
  });
  const withOrg = adapter.mergeOrgConfig(canonical, pkg.variables);

  const types = new Set(adapter.listResourceTypes(withOrg));
  const helpersDir = path.join(opts.policiesRoot, "_helpers");
  const targets = discoverPolicies(
    opts.policiesRoot,
    adapter.policiesSubdir(),
    types,
    pkg.policy_groups
  );

  const inputPath = writeTempInput(withOrg);
  const failures: CheckResult["failures"] = [];
  let evaluated = 0;

  try {
    for (const target of targets) {
      for (const policyFile of target.policyFiles) {
        const packageName = readRegoPackage(policyFile);
        const policyDir = target.dir;
        evaluated += 1;
        const message = await opaEvalMessage(helpersDir, policyDir, inputPath, packageName);
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
  };
}
