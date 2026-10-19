import fs from "node:fs";
import path from "node:path";

export type PolicyTarget = {
  dir: string;
  resourceType: string;
  policyFiles: string[];
};

/**
 * Discover policies under policies/<platform>/... that match resource types in the plan.
 * Layout: <Service>/<resource>/_vars.rego and <Service>/<resource>/<argument>/policy.rego.
 * `dir` is the resource folder; policy_groups name argument folders.
 */
export function discoverPolicies(
  policiesRoot: string,
  platformSubdir: string,
  resourceTypes: Set<string>,
  policyGroups: Record<string, string[]>
): PolicyTarget[] {
  const platformRoot = path.join(policiesRoot, platformSubdir);
  if (!fs.existsSync(platformRoot)) {
    throw new Error(`Policies root not found: ${platformRoot}`);
  }

  // resource folder -> its argument policy files
  const byResourceDir = new Map<string, string[]>();

  function walk(dir: string) {
    for (const ent of fs.readdirSync(dir, { withFileTypes: true })) {
      const full = path.join(dir, ent.name);
      if (ent.isDirectory()) {
        walk(full);
        continue;
      }
      if (ent.name !== "policy.rego") continue;
      const resourceDir = path.dirname(path.dirname(full));
      byResourceDir.set(resourceDir, [...(byResourceDir.get(resourceDir) ?? []), full]);
    }
  }

  walk(platformRoot);

  const targets: PolicyTarget[] = [];
  for (const [dir, allPolicies] of byResourceDir) {
    const varsFile = path.join(dir, "_vars.rego");
    if (!fs.existsSync(varsFile)) continue;
    const text = fs.readFileSync(varsFile, "utf8");
    // PDE _vars use variables.resource_type; some older files use resource_type :=
    const m =
      text.match(/"resource_type"\s*:\s*"([^"]+)"/) ||
      text.match(/resource_type\s*:=\s*"([^"]+)"/);
    const resourceType = m?.[1];
    if (!resourceType || !resourceTypes.has(resourceType)) continue;

    const allowed = policyGroups[resourceType];
    const policyFiles =
      allowed && allowed.length > 0
        ? allPolicies.filter((f) => allowed.includes(path.basename(path.dirname(f))))
        : allPolicies;

    if (policyFiles.length === 0) continue;
    targets.push({ dir, resourceType, policyFiles });
  }
  return targets;
}

/** Rego package name from file content (first `package ...` line). */
export function readRegoPackage(file: string): string {
  const text = fs.readFileSync(file, "utf8");
  const m = text.match(/^package\s+([^\s]+)/m);
  if (!m) throw new Error(`No package line in ${file}`);
  return m[1]!;
}
