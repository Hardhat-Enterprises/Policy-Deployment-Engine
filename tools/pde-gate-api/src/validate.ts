import { HttpError } from "./http-error.js";
import { policiesRoot } from "./engine/evaluate.js";
import { getAdapter } from "./engine/plugins/index.js";
import type { PlatformId } from "./engine/plugins/types.js";
import { loadPolicyCatalog, policyGroupProblems, type PolicyCatalog } from "./engine/policy-select.js";
import type { CreatePackageRequest } from "./types.js";

const PLATFORMS: readonly PlatformId[] = ["gcp", "aws", "azure"];

/** GCP names: a region is australia-southeast1, a zone australia-southeast1-a. */
const ORG_VALUE_SHAPES: Record<string, { shape: RegExp; example: string }> = {
  approved_regions: { shape: /^[a-z]+-[a-z]+[0-9]+$/, example: "us-central1" },
  approved_zones: { shape: /^[a-z]+-[a-z]+[0-9]+-[a-z]$/, example: "us-central1-a" },
};

function isPlainObject(value: unknown): value is Record<string, unknown> {
  return typeof value === "object" && value !== null && !Array.isArray(value);
}

/** The request body as an object, or a 400. */
export function bodyObject(body: unknown): Record<string, unknown> {
  if (!isPlainObject(body)) throw new HttpError(400, "request body must be a JSON object");
  return body;
}

export function requiredString(body: Record<string, unknown>, field: string, max = 255): string {
  const value = body[field];
  if (typeof value !== "string" || !value.trim()) {
    throw new HttpError(400, `${field} is required and must be a non-empty string`);
  }
  if (value.length > max) throw new HttpError(400, `${field} must be at most ${max} characters`);
  return value.trim();
}

export const MIN_PASSWORD_LENGTH = 12;
const MAX_PASSWORD_LENGTH = 1024;

/**
 * A password exactly as typed: never trimmed, so a leading or trailing space is part
 * of it at register and at login alike. `minLength` applies at register only.
 */
export function password(body: Record<string, unknown>, minLength = 1): string {
  const value = body.password;
  if (typeof value !== "string" || value.length === 0) {
    throw new HttpError(400, "password is required and must be a string");
  }
  if (value.length < minLength) throw new HttpError(400, `password must be at least ${minLength} characters`);
  if (value.length > MAX_PASSWORD_LENGTH) {
    throw new HttpError(400, `password must be at most ${MAX_PASSWORD_LENGTH} characters`);
  }
  return value;
}

export function optionalString(body: Record<string, unknown>, field: string, max = 10_000): string | undefined {
  const value = body[field];
  if (value === undefined) return undefined;
  if (typeof value !== "string") throw new HttpError(400, `${field} must be a string`);
  if (value.length > max) throw new HttpError(400, `${field} must be at most ${max} characters`);
  return value;
}

export function optionalBoolean(body: Record<string, unknown>, field: string): boolean | undefined {
  const value = body[field];
  if (value === undefined) return undefined;
  if (typeof value !== "boolean") throw new HttpError(400, `${field} must be a boolean`);
  return value;
}

export function optionalPlatform(body: Record<string, unknown>, field: string): PlatformId | undefined {
  const value = body[field];
  if (value === undefined) return undefined;
  if (typeof value !== "string" || !PLATFORMS.includes(value as PlatformId)) {
    throw new HttpError(400, `${field} must be one of ${PLATFORMS.join(", ")}`);
  }
  return value as PlatformId;
}

function stringList(value: unknown, field: string): string[] {
  if (!Array.isArray(value) || !value.every((v) => typeof v === "string" && v.trim() !== "")) {
    throw new HttpError(400, `${field} must be an array of non-empty strings`);
  }
  return value.map((v: string) => v.trim());
}

/** Union of the catalogues of `platforms` (a platform with no policies contributes nothing). */
function catalogFor(platforms: string[]): PolicyCatalog {
  const merged: PolicyCatalog = new Map();
  for (const platform of platforms) {
    let catalog: PolicyCatalog;
    try {
      catalog = loadPolicyCatalog(policiesRoot(), getAdapter(platform as PlatformId).policiesSubdir());
    } catch {
      continue;
    }
    for (const [resourceType, targets] of catalog) merged.set(resourceType, targets);
  }
  return merged;
}

/**
 * A create (partial=false) or PATCH (partial=true) package body, checked field by
 * field. policy_groups must name resource types and arguments that exist in the
 * policies of the package's platforms (`currentPlatforms` for a PATCH that does not
 * change them).
 */
export function packageBody(
  raw: unknown,
  opts: { partial: boolean; currentPlatforms?: string[] }
): Partial<CreatePackageRequest> {
  const body = bodyObject(raw);
  const out: Partial<CreatePackageRequest> = {};

  if (!opts.partial || body.name !== undefined) out.name = requiredString(body, "name");
  const description = optionalString(body, "description");
  if (description !== undefined) out.description = description;

  if (body.platforms !== undefined) {
    const platforms = stringList(body.platforms, "platforms");
    if (platforms.length === 0 || !platforms.every((p) => PLATFORMS.includes(p as PlatformId))) {
      throw new HttpError(400, `platforms must be a non-empty list of ${PLATFORMS.join(", ")}`);
    }
    out.platforms = [...new Set(platforms)];
  }

  if (body.policy_groups !== undefined) {
    const platforms = out.platforms ?? opts.currentPlatforms ?? ["gcp"];
    const problems = policyGroupProblems(body.policy_groups, catalogFor(platforms));
    if (problems.length > 0) throw new HttpError(400, problems.slice(0, 20).join("; "));
    out.policy_groups = body.policy_groups as Record<string, string[]>;
  }

  if (body.variables !== undefined) {
    if (!isPlainObject(body.variables)) throw new HttpError(400, "variables must be an object");
    const variables: Record<string, unknown> = { ...body.variables };
    for (const [field, { shape, example }] of Object.entries(ORG_VALUE_SHAPES)) {
      if (variables[field] === undefined) continue;
      const list = stringList(variables[field], `variables.${field}`);
      const bad = list.filter((v) => !shape.test(v));
      if (bad.length > 0) {
        throw new HttpError(
          400,
          `variables.${field}: ${JSON.stringify(bad.slice(0, 10))} ${bad.length === 1 ? "is not a GCP name" : "are not GCP names"} (e.g. ${example})`
        );
      }
      variables[field] = list;
    }
    if (variables.google_provider_version !== undefined && typeof variables.google_provider_version !== "string") {
      throw new HttpError(400, "variables.google_provider_version must be a string");
    }
    out.variables = variables;
  }

  return out;
}
