export type PlatformId = "gcp" | "aws" | "azure";

export type PlanResource = {
  type?: string;
  name?: string;
  values?: Record<string, unknown>;
  [key: string]: unknown;
};

export type CanonicalPlan = {
  format_version?: string;
  terraform_version?: string;
  planned_values: {
    root_module: {
      resources: PlanResource[];
    };
  };
  org_config?: Record<string, unknown>;
  [key: string]: unknown;
};

export type PolicyPackage = {
  package_id: string;
  name: string;
  platforms: string[];
  policy_groups: Record<string, string[]>;
  variables?: Record<string, unknown>;
};

export type PlatformAdapter = {
  id: PlatformId;
  detect(plan: Record<string, unknown>): boolean;
  listResourceTypes(plan: CanonicalPlan): string[];
  policiesSubdir(): string;
  mergeOrgConfig(
    plan: CanonicalPlan,
    variables: Record<string, unknown> | undefined
  ): CanonicalPlan;
};

export type CanonicalizeResult = {
  plan: CanonicalPlan;
  warnings: string[];
};

export type CanonicalizeOpts = {
  strict?: boolean;
  googleProviderVersion?: string;
};

export type Canonicalizer = {
  id: PlatformId;
  canonicalize(plan: Record<string, unknown>, opts?: CanonicalizeOpts): CanonicalizeResult;
};
