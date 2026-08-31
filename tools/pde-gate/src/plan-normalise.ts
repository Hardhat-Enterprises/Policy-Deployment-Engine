/**
 * Terraform plan normalisation and version compatibility (Phase 2 sketch).
 *
 * Orgs may use different Terraform CLI and Google provider versions. PDE helpers
 * expect a canonical shape: planned_values.root_module.resources[] with attributes
 * under resource.values. This module detects versions, validates a support matrix,
 * flattens nested child_modules, and optionally maps provider attribute aliases.
 */

import fs from 'node:fs';
import type { OrgConfig, OrgTerraformConstraints } from './org-config.js';

/** PDE contributor fixtures pin this Google provider version. */
export const PDE_GOOGLE_PROVIDER_PIN = '7.37.0';

/** Official support matrix — document in SRS/README. */
export const PDE_SUPPORT_MATRIX = {
    terraform: { min: '1.5.0', max: '1.99.99' },
    format_version: ['1.0', '1.1', '1.2'],
    google_provider: { min: '7.0.0', max: '7.99.99' },
} as const;

export type PlanResource = {
    type?: string;
    name?: string;
    values?: Record<string, unknown>;
    [key: string]: unknown;
};

export type PlanMeta = {
    terraform_version: string | null;
    format_version: string | null;
    google_provider_version: string | null;
    resource_count: number;
    flattened_child_modules: number;
};

export type NormaliseOptions = {
    strictVersions?: boolean;
    orgConfig?: OrgConfig | null;
};

export type NormaliseResult = {
    plan: Record<string, unknown>;
    meta: PlanMeta;
    warnings: string[];
};

type TfModule = {
    resources?: PlanResource[];
    child_modules?: TfModule[];
};

function parseSemver(version: string): [number, number, number] | null {
    const core = version.trim().replace(/^v/, '').split('-')[0];
    const parts = core.split('.').map((p) => Number.parseInt(p, 10));
    if (parts.length < 1 || parts.some((n) => Number.isNaN(n))) return null;
    return [parts[0] ?? 0, parts[1] ?? 0, parts[2] ?? 0];
}

function cmpSemver(a: string, b: string): number {
    const av = parseSemver(a);
    const bv = parseSemver(b);
    if (!av || !bv) return 0;
    for (let i = 0; i < 3; i++) {
        if (av[i]! < bv[i]!) return -1;
        if (av[i]! > bv[i]!) return 1;
    }
    return 0;
}

function inSemverRange(version: string, min: string, max: string): boolean {
    return cmpSemver(version, min) >= 0 && cmpSemver(version, max) <= 0;
}

function majorPrefix(version: string): string | null {
    const parsed = parseSemver(version);
    return parsed ? `${parsed[0]}` : null;
}

/** Walk root_module and all child_modules; return flat resource list. */
export function flattenModuleResources(module: TfModule | undefined): {
    resources: PlanResource[];
    childModuleCount: number;
} {
    if (!module) return { resources: [], childModuleCount: 0 };

    const own = module.resources ?? [];
    const children = module.child_modules ?? [];
    const nested = children.flatMap((child) => {
        const { resources, childModuleCount } = flattenModuleResources(child);
        return resources;
    });

    return {
        resources: [...own, ...nested],
        childModuleCount:
            children.length +
            children.reduce((n, c) => n + flattenModuleResources(c).childModuleCount, 0),
    };
}

/**
 * Best-effort Google provider version from plan JSON.
 * Plan files do not always include provider versions — org-config can supply a fallback.
 */
export function detectGoogleProviderVersion(
    plan: Record<string, unknown>,
    orgConstraints?: OrgTerraformConstraints
): string | null {
    if (orgConstraints?.google_provider_version) {
        return orgConstraints.google_provider_version;
    }

    const configuration = plan.configuration as Record<string, unknown> | undefined;
    const providerConfig = configuration?.provider_config as
        | Record<string, Record<string, unknown>>
        | undefined;
    if (providerConfig) {
        for (const cfg of Object.values(providerConfig)) {
            const fullName = String(cfg.full_name ?? cfg.name ?? '');
            if (fullName.includes('hashicorp/google') || fullName === 'google') {
                const version = cfg.version ?? cfg.version_constraint;
                if (typeof version === 'string' && version.trim()) {
                    return version.replace(/^[=~^]+\s*/, '');
                }
            }
        }
    }

    const providerSchemas = plan.provider_schemas as
        | Record<string, { provider?: { version?: string } }>
        | undefined;
    if (providerSchemas) {
        for (const [key, schema] of Object.entries(providerSchemas)) {
            if (key.includes('hashicorp/google')) {
                const v = schema?.provider?.version;
                if (typeof v === 'string' && v.trim()) return v;
            }
        }
    }

    return null;
}

export function detectPlanMeta(
    plan: Record<string, unknown>,
    orgConfig?: OrgConfig | null
): PlanMeta {
    const rootModule = (plan.planned_values as { root_module?: TfModule } | undefined)?.root_module;
    const { resources, childModuleCount } = flattenModuleResources(rootModule);

    return {
        terraform_version:
            typeof plan.terraform_version === 'string' ? plan.terraform_version : null,
        format_version: typeof plan.format_version === 'string' ? plan.format_version : null,
        google_provider_version: detectGoogleProviderVersion(plan, orgConfig?.terraform),
        resource_count: resources.length,
        flattened_child_modules: childModuleCount,
    };
}

function validateAgainstMatrix(meta: PlanMeta, strict: boolean): string[] {
    const issues: string[] = [];

    if (meta.terraform_version) {
        const { min, max } = PDE_SUPPORT_MATRIX.terraform;
        if (!inSemverRange(meta.terraform_version, min, max)) {
            issues.push(
                `Terraform ${meta.terraform_version} is outside supported range ${min}–${max}`
            );
        }
    } else if (strict) {
        issues.push('terraform_version missing from plan JSON');
    }

    if (meta.format_version) {
        if (!PDE_SUPPORT_MATRIX.format_version.includes(meta.format_version as '1.0')) {
            issues.push(
                `Plan format_version ${meta.format_version} is not supported (expected ${PDE_SUPPORT_MATRIX.format_version.join(', ')})`
            );
        }
    } else if (strict) {
        issues.push('format_version missing from plan JSON');
    }

    if (meta.google_provider_version) {
        const { min, max } = PDE_SUPPORT_MATRIX.google_provider;
        if (!inSemverRange(meta.google_provider_version, min, max)) {
            issues.push(
                `Google provider ${meta.google_provider_version} is outside PDE-supported range ${min}–${max} (PDE policies tested on ${PDE_GOOGLE_PROVIDER_PIN})`
            );
        }
    } else {
        issues.push(
            `Google provider version not detected in plan — policies are authored for provider ${PDE_GOOGLE_PROVIDER_PIN}; set org-config.terraform.google_provider_version if needed`
        );
    }

    return issues;
}

function validateAgainstOrgConstraints(
    meta: PlanMeta,
    constraints: OrgTerraformConstraints
): string[] {
    const issues: string[] = [];

    if (constraints.min_version && meta.terraform_version) {
        if (cmpSemver(meta.terraform_version, constraints.min_version) < 0) {
            issues.push(
                `Terraform ${meta.terraform_version} is below org minimum ${constraints.min_version}`
            );
        }
    }
    if (constraints.max_version && meta.terraform_version) {
        if (cmpSemver(meta.terraform_version, constraints.max_version) > 0) {
            issues.push(
                `Terraform ${meta.terraform_version} is above org maximum ${constraints.max_version}`
            );
        }
    }

    const allowed = constraints.allowed_google_provider;
    if (allowed?.length && meta.google_provider_version) {
        const major = majorPrefix(meta.google_provider_version);
        const ok = allowed.some(
            (a) => meta.google_provider_version === a || majorPrefix(a) === major
        );
        if (!ok) {
            issues.push(
                `Google provider ${meta.google_provider_version} is not in org allowlist: ${allowed.join(', ')}`
            );
        }
    }

    return issues;
}

/**
 * Future: map attribute names when provider majors rename fields.
 * MVP returns values unchanged.
 */
export function mapProviderAttributes(
    resource: PlanResource,
    _googleProviderVersion: string | null
): PlanResource {
    return resource;
}

/**
 * Build canonical plan shape for OPA / PDE helpers.
 * Preserves original top-level fields; replaces planned_values.root_module.resources
 * with a flattened list from all modules.
 */
export function normalisePlan(raw: unknown, options: NormaliseOptions = {}): NormaliseResult {
    if (!raw || typeof raw !== 'object') {
        throw new Error('Plan must be a JSON object');
    }

    const plan = structuredClone(raw) as Record<string, unknown>;
    const warnings: string[] = [];

    const rootModule = (plan.planned_values as { root_module?: TfModule } | undefined)?.root_module;
    const { resources, childModuleCount } = flattenModuleResources(rootModule);

    if (!plan.planned_values || typeof plan.planned_values !== 'object') {
        plan.planned_values = { root_module: { resources: [] } };
    }
    const plannedValues = plan.planned_values as { root_module: TfModule };
    if (!plannedValues.root_module) {
        plannedValues.root_module = { resources: [] };
    }

    const metaBefore = detectPlanMeta(plan, options.orgConfig);
    const mapped = resources.map((r) =>
        mapProviderAttributes(r, metaBefore.google_provider_version)
    );
    plannedValues.root_module.resources = mapped;

    if (childModuleCount > 0) {
        warnings.push(
            `Flattened ${childModuleCount} child module(s) into root_module.resources for OPA`
        );
    }

    const meta = detectPlanMeta(plan, options.orgConfig);

    const matrixIssues = validateAgainstMatrix(meta, Boolean(options.strictVersions));
    for (const issue of matrixIssues) {
        if (options.strictVersions && !issue.includes('not detected')) {
            throw new Error(issue);
        }
        warnings.push(issue);
    }

    if (options.orgConfig?.terraform) {
        const orgIssues = validateAgainstOrgConstraints(meta, options.orgConfig.terraform);
        if (options.strictVersions && orgIssues.length > 0) {
            throw new Error(orgIssues[0]);
        }
        warnings.push(...orgIssues);
    }

    return { plan, meta, warnings };
}

export function formatPlanMetaLine(meta: PlanMeta): string {
    return [
        `terraform=${meta.terraform_version ?? 'unknown'}`,
        `format=${meta.format_version ?? 'unknown'}`,
        `google=${meta.google_provider_version ?? 'unknown'}`,
        `resources=${meta.resource_count}`,
    ].join(' ');
}

export function loadAndNormalisePlan(
    planPath: string,
    options: NormaliseOptions = {}
): NormaliseResult {
    const raw = JSON.parse(fs.readFileSync(planPath, 'utf8'));
    return normalisePlan(raw, options);
}
