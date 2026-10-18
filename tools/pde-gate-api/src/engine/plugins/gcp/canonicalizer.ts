import type { CanonicalPlan, Canonicalizer, PlanResource } from "../types.js";
import { applyVersionRegistry, loadVersionRegistry } from "./registry/loader.js";

/** PDE policies are authored against this Google provider pin. */
export const PDE_GOOGLE_PROVIDER_PIN = "7.37.0";

/**
 * Enforced support matrix for GCP checks.
 * Out-of-range versions fail when strict (API checks enforce by default).
 */
export const PDE_SUPPORT_MATRIX = {
  terraform: { min: "1.5.0", max: "1.99.99" },
  format_version: ["1.0", "1.1", "1.2"] as readonly string[],
  google_provider: { min: "7.0.0", max: "7.99.99" },
} as const;

export type CanonicalizeOpts = {
  /** Reject unsupported / missing versions (API default: true). */
  strict?: boolean;
  /** Fallback when plan JSON has no provider version (from package.variables). */
  googleProviderVersion?: string;
};

type TfModule = {
  resources?: PlanResource[];
  child_modules?: TfModule[];
};

function parseSemver(version: string): [number, number, number] | null {
  const core = version.trim().replace(/^v/, "").split("-")[0]!;
  const parts = core.split(".").map((p) => Number.parseInt(p, 10));
  if (parts.some((n) => Number.isNaN(n))) return null;
  return [parts[0] ?? 0, parts[1] ?? 0, parts[2] ?? 0];
}

function cmp(a: string, b: string): number {
  const av = parseSemver(a);
  const bv = parseSemver(b);
  if (!av || !bv) return 0;
  for (let i = 0; i < 3; i++) {
    if (av[i]! < bv[i]!) return -1;
    if (av[i]! > bv[i]!) return 1;
  }
  return 0;
}

function inRange(version: string, min: string, max: string): boolean {
  return cmp(version, min) >= 0 && cmp(version, max) <= 0;
}

function flatten(module: TfModule | undefined): PlanResource[] {
  if (!module) return [];
  const own = module.resources ?? [];
  const nested = (module.child_modules ?? []).flatMap((c) => flatten(c));
  return [...own, ...nested];
}

function failOrWarn(strict: boolean, warnings: string[], msg: string): void {
  if (strict) throw new Error(msg);
  warnings.push(msg);
}

/** Best-effort Google provider version from plan JSON + optional package fallback. */
export function detectGoogleProviderVersion(
  plan: Record<string, unknown>,
  fallback?: string
): string | null {
  if (fallback?.trim()) return fallback.trim().replace(/^v/, "");

  const configuration = plan.configuration as
    | { provider_config?: Record<string, { version?: string; full_name?: string; name?: string }> }
    | undefined;
  const providerConfig = configuration?.provider_config;
  if (providerConfig) {
    for (const cfg of Object.values(providerConfig)) {
      const name = `${cfg.full_name ?? ""} ${cfg.name ?? ""}`.toLowerCase();
      if (name.includes("google") && cfg.version) return String(cfg.version).replace(/^v/, "");
    }
  }

  const schemas = plan.provider_schemas as
    | Record<string, { provider?: { version?: string } }>
    | undefined;
  if (schemas) {
    for (const [key, schema] of Object.entries(schemas)) {
      if (key.toLowerCase().includes("google") && schema?.provider?.version) {
        return String(schema.provider.version).replace(/^v/, "");
      }
    }
  }

  return null;
}

function enforceVersions(
  raw: Record<string, unknown>,
  opts: CanonicalizeOpts | undefined,
  warnings: string[]
): { tf: string; format: string; google: string | null } {
  const strict = opts?.strict === true;
  const tf = String(raw.terraform_version ?? "").trim();
  const format = String(raw.format_version ?? "").trim();
  const google = detectGoogleProviderVersion(raw, opts?.googleProviderVersion);

  if (!tf) {
    failOrWarn(strict, warnings, "Missing terraform_version in plan JSON");
  } else {
    const { min, max } = PDE_SUPPORT_MATRIX.terraform;
    if (!inRange(tf, min, max)) {
      failOrWarn(
        strict,
        warnings,
        `Unsupported terraform_version ${tf} (supported ${min}–${max})`
      );
    }
  }

  if (!format) {
    failOrWarn(strict, warnings, "Missing format_version in plan JSON");
  } else if (!PDE_SUPPORT_MATRIX.format_version.includes(format)) {
    failOrWarn(
      strict,
      warnings,
      `Unsupported format_version ${format} (supported ${PDE_SUPPORT_MATRIX.format_version.join(", ")})`
    );
  }

  if (!google) {
    failOrWarn(
      strict,
      warnings,
      `Google provider version not found in plan. Set package variables.google_provider_version (PDE pin ${PDE_GOOGLE_PROVIDER_PIN})`
    );
  } else {
    const { min, max } = PDE_SUPPORT_MATRIX.google_provider;
    if (!inRange(google, min, max)) {
      failOrWarn(
        strict,
        warnings,
        `Unsupported Google provider ${google} (supported ${min}–${max}; PDE policies tested on ${PDE_GOOGLE_PROVIDER_PIN})`
      );
    }
  }

  return { tf, format, google };
}

export const gcpCanonicalizer: Canonicalizer = {
  id: "gcp",
  canonicalize(raw, opts) {
    const warnings: string[] = [];
    const { tf, format, google } = enforceVersions(raw, opts, warnings);

    const planned = (raw.planned_values ?? {}) as { root_module?: TfModule };
    const flat = flatten(planned.root_module);

    // Architecture: version pack hook — no packs yet → pass-through.
    const pack =
      tf && google
        ? loadVersionRegistry({ terraform: tf, google_provider: google })
        : null;
    const resources = applyVersionRegistry(flat, pack);

    const plan: CanonicalPlan = {
      ...raw,
      format_version: format || undefined,
      terraform_version: tf || undefined,
      planned_values: { root_module: { resources } },
      ...(google ? { google_provider_version: google } : {}),
    };

    return { plan, warnings };
  },
};
