import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";
import type { PlanResource } from "../../types.js";

export type VersionRegistryPack = {
  terraform?: string;
  google_provider?: string;
  attribute_maps?: Record<string, Record<string, string>>;
};

export type VersionCoords = {
  terraform: string;
  google_provider: string;
};

function registryDir(): string {
  return path.dirname(fileURLToPath(import.meta.url));
}

export function loadVersionRegistry(_coords: VersionCoords): VersionRegistryPack | null {
  const dir = registryDir();
  if (!fs.existsSync(dir)) return null;

  const packs = fs
    .readdirSync(dir)
    .filter((f) => f.endsWith(".json") && !f.endsWith(".schema.json"));
  if (packs.length === 0) return null;

  return null;
}

export function applyVersionRegistry(
  resources: PlanResource[],
  pack: VersionRegistryPack | null
): PlanResource[] {
  if (!pack?.attribute_maps || Object.keys(pack.attribute_maps).length === 0) {
    return resources;
  }

  return resources;
}
