import fs from "node:fs";
import path from "node:path";

/**
 * Policy discovery over the PDE policies/ tree.
 *
 * Layout: policies/<platform>/<Service>/<resource_type>/<argument>/policy.rego,
 * with the resource's _vars.rego (holding "resource_type") one level up. Argument
 * folder names may contain dots; the Rego package always comes from the
 * `package` line, never from the path.
 *
 * Kept byte-identical in tools/pde-gate-api/src/engine/ and tools/pde-gate/src/;
 * the CLI's unit tests fail if the two copies drift.
 */

export const POLICY_FILE = "policy.rego";
export const VARS_FILE = "_vars.rego";

/** One argument policy, as found on disk. */
export type PolicyTarget = {
  resourceType: string;
  argument: string;
  policyFile: string;
  varsFile: string;
  packageName: string;
};

/** resource_type → its argument policies, sorted by argument. */
export type PolicyCatalog = Map<string, PolicyTarget[]>;

const ARGUMENT_NAME = /^[a-z0-9_.]+$/;
const RESOURCE_TYPE_NAME = /^[a-z0-9_]+$/;
const PACKAGE_NAME = /^[A-Za-z0-9_.]+$/;

/** Argument names as policy_groups may name them: lower-case, digits, `_` and `.`, no `..`. */
export function isValidArgumentName(name: unknown): name is string {
  return typeof name === "string" && ARGUMENT_NAME.test(name) && !name.includes("..");
}

export function isValidResourceTypeName(name: unknown): name is string {
  return typeof name === "string" && RESOURCE_TYPE_NAME.test(name);
}

/** Rego package name from file content (first `package ...` line). */
export function readRegoPackage(file: string): string {
  const text = fs.readFileSync(file, "utf8");
  const m = text.match(/^package\s+([^\s#]+)/m);
  if (!m) throw new Error(`No package line in ${file}`);
  return m[1]!;
}

/** The "resource_type" a _vars.rego declares, or null. */
export function readResourceType(varsFile: string): string | null {
  const text = fs.readFileSync(varsFile, "utf8");
  return text.match(/"resource_type"\s*:\s*"([^"]+)"/)?.[1] ?? null;
}

const catalogCache = new Map<string, PolicyCatalog>();

export function clearPolicyCatalogCache(): void {
  catalogCache.clear();
}

/**
 * Every argument policy under policies/<platformSubdir>/, keyed by resource type.
 * Cached per platform root for the life of the process (the tree only changes on deploy).
 */
export function loadPolicyCatalog(policiesRoot: string, platformSubdir: string): PolicyCatalog {
  const platformRoot = path.resolve(policiesRoot, platformSubdir);
  const cached = catalogCache.get(platformRoot);
  if (cached) return cached;
  if (!fs.existsSync(platformRoot)) {
    throw new Error(`Policies root not found: ${platformRoot}`);
  }

  const catalog: PolicyCatalog = new Map();

  function add(policyFile: string) {
    const argumentDir = path.dirname(policyFile);
    const resourceDir = path.dirname(argumentDir);
    const varsFile = path.join(resourceDir, VARS_FILE);
    if (!fs.existsSync(varsFile)) return;
    const resourceType = readResourceType(varsFile);
    const argument = path.basename(argumentDir);
    if (!isValidResourceTypeName(resourceType) || !isValidArgumentName(argument)) return;
    let packageName: string;
    try {
      packageName = readRegoPackage(policyFile);
    } catch {
      return;
    }
    if (!PACKAGE_NAME.test(packageName)) return;
    const list = catalog.get(resourceType) ?? [];
    list.push({ resourceType, argument, policyFile, varsFile, packageName });
    catalog.set(resourceType, list);
  }

  function walk(dir: string) {
    for (const ent of fs.readdirSync(dir, { withFileTypes: true })) {
      const full = path.join(dir, ent.name);
      if (ent.isDirectory()) walk(full);
      else if (ent.name === POLICY_FILE) add(full);
    }
  }

  walk(platformRoot);
  for (const list of catalog.values()) {
    list.sort((a, b) => a.argument.localeCompare(b.argument));
  }
  catalogCache.set(platformRoot, catalog);
  return catalog;
}

/**
 * Problems with a package's policy_groups: a malformed shape or name, or a
 * resource type / argument the catalog does not have. Empty when it is valid.
 */
export function policyGroupProblems(policyGroups: unknown, catalog: PolicyCatalog): string[] {
  if (policyGroups === undefined) return [];
  if (!policyGroups || typeof policyGroups !== "object" || Array.isArray(policyGroups)) {
    return ["policy_groups must be an object of resource_type -> argument names"];
  }
  const problems: string[] = [];
  for (const [resourceType, args] of Object.entries(policyGroups)) {
    if (!isValidResourceTypeName(resourceType)) {
      problems.push(`policy_groups: invalid resource type name ${JSON.stringify(resourceType)}`);
      continue;
    }
    if (!Array.isArray(args)) {
      problems.push(`policy_groups.${resourceType} must be an array of argument names`);
      continue;
    }
    const known = catalog.get(resourceType);
    if (!known) {
      problems.push(`policy_groups: unknown resource type ${resourceType}`);
      continue;
    }
    const names = new Set(known.map((t) => t.argument));
    for (const arg of args) {
      if (!isValidArgumentName(arg)) {
        problems.push(`policy_groups.${resourceType}: invalid argument name ${JSON.stringify(arg)}`);
      } else if (!names.has(arg)) {
        problems.push(`policy_groups.${resourceType}: unknown argument ${arg}`);
      }
    }
  }
  return problems;
}

/**
 * The policies to run for a plan: every policy of each resource type in the plan,
 * narrowed by policy_groups[resource_type] when it names arguments. policy_groups
 * only filters what discovery found — no path is ever built from it.
 */
export function selectPolicies(
  catalog: PolicyCatalog,
  resourceTypes: Iterable<string>,
  policyGroups: Record<string, unknown> | undefined
): { targets: PolicyTarget[]; warnings: string[] } {
  const groups = policyGroups ?? {};
  const targets: PolicyTarget[] = [];
  const warnings = policyGroupProblems(groups, catalog);
  for (const resourceType of [...new Set(resourceTypes)].sort()) {
    const all = catalog.get(resourceType);
    if (!all) {
      warnings.push(`no PDE policies for resource type ${resourceType}`);
      continue;
    }
    const wanted = groups[resourceType];
    const names = Array.isArray(wanted) ? wanted.filter(isValidArgumentName) : [];
    targets.push(...(names.length > 0 ? all.filter((t) => names.includes(t.argument)) : all));
  }
  return { targets, warnings };
}

/** Catalog + selection in one call. */
export function discoverPolicies(
  policiesRoot: string,
  platformSubdir: string,
  resourceTypes: Iterable<string>,
  policyGroups: Record<string, unknown> | undefined
): { targets: PolicyTarget[]; warnings: string[] } {
  return selectPolicies(loadPolicyCatalog(policiesRoot, platformSubdir), resourceTypes, policyGroups);
}
