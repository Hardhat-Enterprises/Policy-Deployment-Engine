import fs from "node:fs";
import path from "node:path";

export type PolicyTarget = {
  dir: string;
  resourceType: string;
  policyFiles: string[];
};

/** Discover policy dirs under policies/<platform>/... that match resource types in the plan. */
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

  const targets: PolicyTarget[] = [];

  function walk(dir: string) {
    for (const ent of fs.readdirSync(dir, { withFileTypes: true })) {
      const full = path.join(dir, ent.name);
      if (ent.isDirectory()) {
        walk(full);
        continue;
      }
      if (ent.name !== "_vars.rego") continue;
      const text = fs.readFileSync(full, "utf8");
      // PDE _vars use variables.resource_type; some older files use resource_type :=
      const m =
        text.match(/"resource_type"\s*:\s*"([^"]+)"/) ||
        text.match(/resource_type\s*:=\s*"([^"]+)"/);
      const resourceType = m?.[1];
      if (!resourceType || !resourceTypes.has(resourceType)) continue;

      const allowed = policyGroups[resourceType];
      const allRego = fs
        .readdirSync(dir)
        .filter((f) => f.endsWith(".rego") && f !== "_vars.rego");
      const policyFiles =
        allowed && allowed.length > 0
          ? allRego.filter((f) => allowed.includes(path.basename(f, ".rego")))
          : allRego;

      if (policyFiles.length === 0) continue;
      targets.push({
        dir,
        resourceType,
        policyFiles: policyFiles.map((f) => path.join(dir, f)),
      });
    }
  }

  walk(platformRoot);
  return targets;
}

/** Rego package name from file content (first `package ...` line). */
export function readRegoPackage(file: string): string {
  const text = fs.readFileSync(file, "utf8");
  const m = text.match(/^package\s+([^\s]+)/m);
  if (!m) throw new Error(`No package line in ${file}`);
  return m[1]!;
}
