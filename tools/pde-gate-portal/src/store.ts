import crypto from "node:crypto";
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";
import type { OrgRecord, RegisterRequest } from "./types.js";

const DATA_DIR = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..", "data");
const DATA_FILE = path.join(DATA_DIR, "orgs.json");

type StoreData = {
    orgs: OrgRecord[];
};

function ensureDataFile(): void {
    fs.mkdirSync(DATA_DIR, { recursive: true });
    if (!fs.existsSync(DATA_FILE)) {
        fs.writeFileSync(DATA_FILE, JSON.stringify({ orgs: [] }, null, 2) + "\n");
    }
}

function readStore(): StoreData {
    ensureDataFile();
    return JSON.parse(fs.readFileSync(DATA_FILE, "utf8")) as StoreData;
}

function writeStore(data: StoreData): void {
    ensureDataFile();
    fs.writeFileSync(DATA_FILE, JSON.stringify(data, null, 2) + "\n");
}

function slugifyOrgId(name: string): string {
    const base = name
        .trim()
        .toLowerCase()
        .replace(/[^a-z0-9]+/g, "-")
        .replace(/^-+|-+$/g, "");
    const suffix = crypto.randomBytes(2).toString("hex");
    return `${base || "org"}-${suffix}`;
}

function newToken(): string {
    return `pde_tok_${crypto.randomBytes(24).toString("hex")}`;
}

export function createOrg(input: RegisterRequest): OrgRecord {
    const store = readStore();
    const org: OrgRecord = {
        org_id: slugifyOrgId(input.org_name),
        token: newToken(),
        schema_version: "1",
        org_name: input.org_name.trim(),
        registered_at: new Date().toISOString(),
        approved_regions: input.approved_regions,
        approved_zones: input.approved_zones ?? [],
        policy_pin: "main",
        contact_email: input.contact_email.trim(),
        policy_profile: input.policy_profile ?? "full",
        enabled_policies: input.enabled_policies,
    };
    store.orgs.push(org);
    writeStore(store);
    return org;
}

export function findOrgById(orgId: string): OrgRecord | undefined {
    return readStore().orgs.find((o) => o.org_id === orgId);
}

export function validateToken(orgId: string, token: string): OrgRecord | null {
    const org = findOrgById(orgId);
    if (!org || org.token !== token) {
        return null;
    }
    return org;
}

export type UpdateOrgInput = {
    approved_regions?: string[];
    approved_zones?: string[];
    policy_profile?: string;
    enabled_policies?: Record<string, string[]>;
};

export function updateOrg(orgId: string, token: string, input: UpdateOrgInput): OrgRecord | null {
    const store = readStore();
    const index = store.orgs.findIndex((o) => o.org_id === orgId);
    if (index < 0) {
        return null;
    }
    const org = store.orgs[index];
    if (org.token !== token) {
        return null;
    }

    if (input.approved_regions !== undefined) {
        org.approved_regions = input.approved_regions;
    }
    if (input.approved_zones !== undefined) {
        org.approved_zones = input.approved_zones;
    }
    if (input.policy_profile !== undefined) {
        org.policy_profile = input.policy_profile;
    }
    if (input.enabled_policies !== undefined) {
        org.enabled_policies = input.enabled_policies;
    }

    store.orgs[index] = org;
    writeStore(store);
    return org;
}

/** Public org config — token stripped before returning to client on GET. */
export function toOrgConfig(org: OrgRecord): Omit<OrgRecord, "token"> {
    const { token: _token, ...config } = org;
    return config;
}

export function resetStoreForTests(): void {
    writeStore({ orgs: [] });
}

export function dataFilePath(): string {
    return DATA_FILE;
}
