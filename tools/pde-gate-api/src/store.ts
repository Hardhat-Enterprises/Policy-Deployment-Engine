import { randomBytes } from "node:crypto";
import { Org, Package } from "./db/models/index.js";
import type { CreatePackageRequest, PolicyPackage } from "./types.js";

function slugId(prefix: string): string {
  return `${prefix}_${randomBytes(6).toString("hex")}`;
}

function apiKey(): string {
  return `pde_${randomBytes(24).toString("hex")}`;
}

export function toPolicyPackage(row: Package): PolicyPackage {
  return {
    package_id: row.package_id,
    name: row.name,
    description: row.description ?? undefined,
    platforms: row.platforms ?? ["gcp"],
    policy_groups: row.policy_groups ?? {},
    variables: (row.variables as PolicyPackage["variables"]) ?? undefined,
    updated_at: row.package_updated_at?.toISOString?.() ?? new Date().toISOString(),
  };
}

import { hashPassword, verifyPassword } from "./password.js";

export async function createOrg(input: {
  org_name: string;
  contact_email: string;
  password?: string;
}): Promise<{ org: Org; api_key: string }> {
  const key = apiKey();
  const passwordHash = hashPassword(input.password || randomBytes(16).toString("hex"));
  const org = await Org.create({
    org_id: slugId("org"),
    token: key,
    org_name: input.org_name.trim(),
    contact_email: input.contact_email.trim(),
    registered_at: new Date(),
    approved_regions: [],
    approved_zones: [],
    schema_version: "1",
    password_hash: passwordHash,
  });
  return { org, api_key: key };
}

export async function loginOrg(
  email: string,
  password: string
): Promise<{ org: Org; api_key: string } | null> {
  const org = await Org.findOne({ where: { contact_email: email.trim() } });
  if (!org || !org.password_hash) return null;
  const ok = verifyPassword(password, org.password_hash);
  if (!ok) return null;
  return { org, api_key: org.token };
}

export async function findOrgByKey(orgId: string, key: string): Promise<Org | null> {
  const org = await Org.findOne({ where: { org_id: orgId } });
  if (!org || org.token !== key) return null;
  return org;
}

export async function listPackages(orgId: string): Promise<PolicyPackage[]> {
  const rows = await Package.findAll({ where: { org_id: orgId }, order: [["name", "ASC"]] });
  return rows.map(toPolicyPackage);
}

export async function getPackage(orgId: string, packageId: string): Promise<PolicyPackage | null> {
  const row = await Package.findOne({ where: { org_id: orgId, package_id: packageId } });
  return row ? toPolicyPackage(row) : null;
}

export async function createPackage(
  orgId: string,
  body: CreatePackageRequest
): Promise<PolicyPackage> {
  const now = new Date();
  const row = await Package.create({
    org_id: orgId,
    package_id: slugId("pkg"),
    name: body.name.trim(),
    description: body.description?.trim() ?? null,
    platforms: body.platforms?.length ? body.platforms : ["gcp"],
    policy_groups: body.policy_groups ?? {},
    variables: body.variables ?? null,
    package_updated_at: now,
  });
  return toPolicyPackage(row);
}

export async function updatePackage(
  orgId: string,
  packageId: string,
  body: Partial<CreatePackageRequest>
): Promise<PolicyPackage | null> {
  const row = await Package.findOne({ where: { org_id: orgId, package_id: packageId } });
  if (!row) return null;
  if (body.name !== undefined) row.name = body.name.trim();
  if (body.description !== undefined) row.description = body.description.trim();
  if (body.platforms !== undefined) row.platforms = body.platforms;
  if (body.policy_groups !== undefined) row.policy_groups = body.policy_groups;
  if (body.variables !== undefined) row.variables = body.variables ?? null;
  row.package_updated_at = new Date();
  await row.save();
  return toPolicyPackage(row);
}

export async function deletePackage(orgId: string, packageId: string): Promise<boolean> {
  const n = await Package.destroy({ where: { org_id: orgId, package_id: packageId } });
  return n > 0;
}
