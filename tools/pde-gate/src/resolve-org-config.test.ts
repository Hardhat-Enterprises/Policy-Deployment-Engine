import assert from "node:assert/strict";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { afterEach, describe, it } from "node:test";
import { resolveOrgConfig } from "../src/resolve-org-config.js";

const sampleOrgConfig = path.resolve(
    path.dirname(fileURLToPath(import.meta.url)),
    "../../../samples/org-input/org-config.json"
);

const ENV_KEYS = ["PDE_ORG_ID", "PDE_ORG_TOKEN", "PDE_API_URL", "PDE_PORTAL_URL"] as const;

function snapshotEnv(): Record<string, string | undefined> {
    return Object.fromEntries(ENV_KEYS.map((key) => [key, process.env[key]]));
}

function restoreEnv(saved: Record<string, string | undefined>): void {
    for (const key of ENV_KEYS) {
        if (saved[key] === undefined) {
            delete process.env[key];
        } else {
            process.env[key] = saved[key];
        }
    }
}

describe("resolve-org-config", () => {
    const savedEnv = snapshotEnv();

    afterEach(() => {
        restoreEnv(savedEnv);
    });

    it("loads org config from file path", async () => {
        const resolved = await resolveOrgConfig({
            orgConfigPath: sampleOrgConfig,
        });
        assert.ok(resolved);
        assert.equal(resolved.source, "file");
        assert.equal(resolved.config.org_id, "om-mqlk");
        assert.ok(resolved.config.approved_regions.length > 0);
    });

    it("returns null when org config not required and not provided", async () => {
        for (const key of ENV_KEYS) {
            delete process.env[key];
        }
        const resolved = await resolveOrgConfig({ requireOrgConfig: false });
        assert.equal(resolved, null);
    });

    it("throws when org config required but missing", async () => {
        for (const key of ENV_KEYS) {
            delete process.env[key];
        }
        await assert.rejects(
            () => resolveOrgConfig({ requireOrgConfig: true }),
            /Organisation config required/
        );
    });
});
