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
    // Only what the package sets: an absent approved_regions / approved_zones must
    // not become [] (that would empty every region whitelist it is substituted into).
    return { ...plan, org_config: { ...(variables ?? {}) } };
  },
};
