import fs from "node:fs";
import path from "node:path";
import { loadPolicyCatalog } from "./policy-select.js";

export type PolicyCatalogResource = {
  service: string;
  resource_type: string;
  /** Argument names: the policy folders under the resource type, as policy_groups takes them. */
  policies: string[];
};

/**
 * Every resource type of a platform with its argument policies, for the portal's
 * package builder. Built on the same discovery the checks use (policy-select.ts),
 * so whatever it lists is a valid policy_groups entry.
 */
export function buildPolicyCatalog(policiesRoot: string, platformSubdir: string): PolicyCatalogResource[] {
  const platformRoot = path.join(policiesRoot, platformSubdir);
  if (!fs.existsSync(platformRoot)) return [];

  const resources: PolicyCatalogResource[] = [];
  for (const [resourceType, targets] of loadPolicyCatalog(policiesRoot, platformSubdir)) {
    if (targets.length === 0) continue;
    const service = path.relative(platformRoot, targets[0]!.policyFile).split(path.sep)[0] ?? "";
    resources.push({
      service: service || "Uncategorised",
      resource_type: resourceType,
      policies: targets.map((target) => target.argument),
    });
  }
  return resources.sort(
    (a, b) => a.service.localeCompare(b.service) || a.resource_type.localeCompare(b.resource_type)
  );
}
