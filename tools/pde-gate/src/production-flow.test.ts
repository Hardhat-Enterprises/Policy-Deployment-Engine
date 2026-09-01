/**
 * End-to-end production flow: portal API → resolve-org-config → org config merge.
 */

import assert from "node:assert/strict";
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import { after, before, describe, it } from "node:test";
import { fileURLToPath, pathToFileURL } from "node:url";
import { mergePlanWithOrgConfig } from "./org-config.js";
import { fetchOrgConfigFromApi } from "./portal-client.js";
import { resolveOrgConfig } from "./resolve-org-config.js";

const repoRoot = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "../../..");
const samplePlan = path.join(repoRoot, "samples/org-input/plan.json");

describe("production flow", () => {
    let server: ReturnType<typeof import("node:http").createServer>;
    let baseUrl: string;
    let orgId: string;
    let token: string;
    const savedEnv = {
        PDE_API_URL: process.env.PDE_API_URL,
        PDE_PORTAL_URL: process.env.PDE_PORTAL_URL,
        PDE_ORG_ID: process.env.PDE_ORG_ID,
        PDE_ORG_TOKEN: process.env.PDE_ORG_TOKEN,
        PDE_GATE_CONFIG_DIR: process.env.PDE_GATE_CONFIG_DIR,
    };

    before(async () => {
        const configDir = fs.mkdtempSync(path.join(os.tmpdir(), "pde-gate-prod-test-"));
        process.env.PDE_GATE_CONFIG_DIR = configDir;

        const portalServer = await import(
            pathToFileURL(path.join(repoRoot, "tools/pde-gate-portal/src/server.js")).href
        );
        const { resetStoreForTests } = await import(
            pathToFileURL(path.join(repoRoot, "tools/pde-gate-portal/src/store.js")).href
        );
        resetStoreForTests();

        const app = portalServer.createApp();
        await new Promise<void>((resolve) => {
            server = app.listen(0, "127.0.0.1", () => resolve());
        });
        const addr = server.address();
        if (!addr || typeof addr === "string") {
            throw new Error("no address");
        }
        baseUrl = `http://127.0.0.1:${addr.port}`;
        process.env.PDE_API_URL = baseUrl;
        process.env.PDE_PORTAL_URL = baseUrl;

        const reg = await fetch(`${baseUrl}/v1/orgs/register`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                org_name: "Production E2E Org",
                contact_email: "e2e@example.com",
                approved_regions: ["australia-southeast1", "australia-southeast2"],
                policy_profile: "baseline",
            }),
        });
        const body = (await reg.json()) as { org_id: string; token: string };
        orgId = body.org_id;
        token = body.token;
        process.env.PDE_ORG_ID = orgId;
        process.env.PDE_ORG_TOKEN = token;
    });

    after(async () => {
        await new Promise<void>((resolve, reject) => {
            server.close((err) => (err ? reject(err) : resolve()));
        });
        for (const [key, value] of Object.entries(savedEnv)) {
            if (value === undefined) {
                delete process.env[key];
            } else {
                process.env[key] = value;
            }
        }
    });

    it("fetches org config from portal API with token", async () => {
        const config = await fetchOrgConfigFromApi({
            orgId,
            token,
            endpoints: { apiUrl: baseUrl, portalUrl: baseUrl },
        });
        assert.deepEqual(config.approved_regions, ["australia-southeast1", "australia-southeast2"]);
        assert.equal(config.policy_profile, "baseline");
    });

    it("resolve-org-config uses portal-api in CI mode", async () => {
        const resolved = await resolveOrgConfig({
            orgId,
            requireOrgConfig: true,
        });
        assert.ok(resolved);
        assert.equal(resolved.source, "portal-api");
        assert.equal(resolved.config.org_id, orgId);
    });

    it("merges portal config into plan input for OPA", async () => {
        const resolved = await resolveOrgConfig({ orgId, requireOrgConfig: true });
        const plan = JSON.parse(fs.readFileSync(samplePlan, "utf8")) as Record<string, unknown>;
        const merged = mergePlanWithOrgConfig(plan, resolved!.config) as {
            org_config: { approved_regions: string[] };
        };
        assert.deepEqual(merged.org_config.approved_regions, [
            "australia-southeast1",
            "australia-southeast2",
        ]);
    });
});
