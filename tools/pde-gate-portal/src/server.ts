import express from "express";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { createOrg, toOrgConfig, updateOrg, validateToken } from "./store.js";
import type { RegisterRequest } from "./types.js";

const PORT = Number(process.env.PDE_PORTAL_PORT ?? 3847);
const publicDir = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..", "public");

const app = express();
app.use(express.json());
app.use(express.static(publicDir));

function parseBearerToken(header: string | undefined): string | null {
    if (!header?.startsWith("Bearer ")) {
        return null;
    }
    const token = header.slice("Bearer ".length).trim();
    return token || null;
}

function parseRegions(raw: unknown): string[] {
    if (Array.isArray(raw)) {
        return raw.map(String).filter(Boolean);
    }
    if (typeof raw === "string") {
        return raw
            .split(",")
            .map((s) => s.trim())
            .filter(Boolean);
    }
    return [];
}

app.get("/health", (_req, res) => {
    res.json({ status: "ok", service: "pde-gate-portal" });
});

/**
 * Register organisation — saves to local JSON database.
 * Returns org_id + token (shown once on success page).
 */
app.post("/v1/orgs/register", (req, res) => {
    const body = req.body as Partial<RegisterRequest>;
    if (!body.org_name?.trim()) {
        res.status(400).json({ error: "org_name is required" });
        return;
    }
    if (!body.contact_email?.trim()) {
        res.status(400).json({ error: "contact_email is required" });
        return;
    }
    const approved_regions = parseRegions(body.approved_regions);
    if (approved_regions.length === 0) {
        res.status(400).json({ error: "approved_regions is required" });
        return;
    }

    const org = createOrg({
        org_name: body.org_name,
        contact_email: body.contact_email,
        approved_regions,
        approved_zones: parseRegions(body.approved_zones),
        policy_profile: body.policy_profile ?? "full",
        enabled_policies: body.enabled_policies,
    });

    res.status(201).json({
        org_id: org.org_id,
        token: org.token,
        message: "Organisation registered. Store the token in CI as PDE_ORG_TOKEN.",
    });
});

/**
 * Fetch org config — token validated here (production auth check).
 * pde-gate CLI calls this on every check.
 */
app.get("/v1/orgs/:orgId/config", (req, res) => {
    const token = parseBearerToken(req.header("authorization"));
    if (!token) {
        res.status(401).json({ error: "Authorization: Bearer <token> required" });
        return;
    }

    const org = validateToken(req.params.orgId ?? "", token);
    if (!org) {
        res.status(401).json({ error: "Invalid org_id or token" });
        return;
    }

    res.json(toOrgConfig(org));
});

/**
 * Update org settings — token validated (production settings management).
 */
app.patch("/v1/orgs/:orgId/config", (req, res) => {
    const token = parseBearerToken(req.header("authorization"));
    if (!token) {
        res.status(401).json({ error: "Authorization: Bearer <token> required" });
        return;
    }

    const body = req.body as {
        approved_regions?: unknown;
        approved_zones?: unknown;
        policy_profile?: string;
        enabled_policies?: Record<string, string[]>;
    };

    const approved_regions = body.approved_regions !== undefined ? parseRegions(body.approved_regions) : undefined;
    if (approved_regions !== undefined && approved_regions.length === 0) {
        res.status(400).json({ error: "approved_regions must be non-empty" });
        return;
    }

    const approved_zones =
        body.approved_zones !== undefined ? parseRegions(body.approved_zones) : undefined;

    const org = updateOrg(req.params.orgId ?? "", token, {
        approved_regions,
        approved_zones,
        policy_profile: body.policy_profile,
        enabled_policies: body.enabled_policies,
    });

    if (!org) {
        res.status(401).json({ error: "Invalid org_id or token" });
        return;
    }

    res.json(toOrgConfig(org));
});

app.get("/register", (_req, res) => {
    res.sendFile(path.join(publicDir, "register.html"));
});

app.get("/settings", (_req, res) => {
    res.sendFile(path.join(publicDir, "settings.html"));
});

export function createApp() {
    return app;
}
