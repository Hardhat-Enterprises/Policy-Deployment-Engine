import type { CanonicalPlan, PlatformAdapter } from "../types.js";

function resourcesOf(plan: CanonicalPlan) {
  return plan.planned_values?.root_module?.resources ?? [];
}

export const gcpAdapter: PlatformAdapter = {
  id: "gcp",
  detect(plan) {
    const root = (plan as CanonicalPlan).planned_values?.root_module;
    const resources = root?.resources ?? [];
    return resources.some((r) => String(r.type ?? "").startsWith("google_"));
  },
  listResourceTypes(plan) {
    return [...new Set(resourcesOf(plan).map((r) => String(r.type ?? "")).filter(Boolean))];
  },
  policiesSubdir() {
    return "gcp";
  },
  mergeOrgConfig(plan, variables) {
    const org_config = {
      approved_regions: (variables?.approved_regions as string[]) ?? [],
      approved_zones: (variables?.approved_zones as string[]) ?? [],
      ...variables,
    };
    return { ...plan, org_config };
  },
};
