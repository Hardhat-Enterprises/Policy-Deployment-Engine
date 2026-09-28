/**
 * Version registry architecture — scalable later, no multi-version rewrites yet.
 *
 * Later: drop packs under this folder, e.g.
 *   terraform-1.9__google-7.37.json
 * Loader selects a pack for (terraform, google) and applyVersionRegistry rewrites
 * resource attributes into a stable shape for Rego.
 *
 * Today: loadVersionRegistry always returns null → apply is pass-through.
 */

import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";
import type { PlanResource } from "../../types.js";

/** Declared shape of a future registry pack (not implemented beyond loading). */
export type VersionRegistryPack = {
  /** e.g. "1.9.0" or range note — for humans / future matching */
  terraform?: string;
  google_provider?: string;
  /**
   * Future: resource_type → { from_attr: to_attr } renames / transforms.
   * Intentionally unused until packs ship.
   */
  attribute_maps?: Record<string, Record<string, string>>;
};

export type VersionCoords = {
  terraform: string;
  google_provider: string;
};

function registryDir(): string {
  return path.dirname(fileURLToPath(import.meta.url));
}

/**
 * Resolve a pack for this Terraform + Google provider pair.
 * ponytail: stub — no packs on disk yet; always null (pass-through).
 * Later: match files like `tf-1.9__google-7.37.json` or a manifest index.
 */
export function loadVersionRegistry(_coords: VersionCoords): VersionRegistryPack | null {
  const dir = registryDir();
  if (!fs.existsSync(dir)) return null;

  // Future: read manifest / match version files. Keep YAGNI — no packs implemented.
  const packs = fs
    .readdirSync(dir)
    .filter((f) => f.endsWith(".json") && !f.endsWith(".schema.json"));
  if (packs.length === 0) return null;

  // ponytail: ceiling = no version matching yet → upgrade by selecting pack from coords
  return null;
}

/**
 * Apply registry rewrites to flattened resources.
 * Today: identity. Later: use pack.attribute_maps.
 */
export function applyVersionRegistry(
  resources: PlanResource[],
  pack: VersionRegistryPack | null
): PlanResource[] {
  if (!pack?.attribute_maps || Object.keys(pack.attribute_maps).length === 0) {
    return resources;
  }

  // Scaffold only — real rewrite lands when packs exist.
  // ponytail: not implemented → pass-through so checks stay correct on PDE pin
  return resources;
}
