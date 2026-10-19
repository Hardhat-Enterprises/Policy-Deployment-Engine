import fs from "node:fs";
import path from "node:path";

export type PolicyCatalogResource = {
  service: string;
  resource_type: string;
  policies: string[];
};

export function buildPolicyCatalog(platformRoot: string): PolicyCatalogResource[] {
  if (!fs.existsSync(platformRoot)) return [];

  const resources: PolicyCatalogResource[] = [];

  function walk(dir: string) {
    for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
      if (entry.isDirectory()) walk(path.join(dir, entry.name));
    }

    const varsPath = path.join(dir, "_vars.rego");
    if (!fs.existsSync(varsPath)) return;

    const varsText = fs.readFileSync(varsPath, "utf8");
    const match =
      varsText.match(/"resource_type"\s*:\s*"([^"]+)"/) ||
      varsText.match(/resource_type\s*:=\s*"([^"]+)"/);
    const resourceType = match?.[1];
    if (!resourceType) return;

    // Each policy is <resource>/<argument>/policy.rego; list the argument folders.
    const policies = fs
      .readdirSync(dir, { withFileTypes: true })
      .filter(entry => entry.isDirectory() && fs.existsSync(path.join(dir, entry.name, "policy.rego")))
      .map(entry => entry.name)
      .sort((a, b) => a.localeCompare(b));
    if (!policies.length) return;

    const parts = path.relative(platformRoot, dir).split(path.sep).filter(Boolean);
    resources.push({
      service: parts.slice(0, -1).join(" / ") || "Uncategorised",
      resource_type: resourceType,
      policies,
    });
  }

  walk(platformRoot);
  return resources.sort((a, b) =>
    a.service.localeCompare(b.service) || a.resource_type.localeCompare(b.resource_type)
  );
}
