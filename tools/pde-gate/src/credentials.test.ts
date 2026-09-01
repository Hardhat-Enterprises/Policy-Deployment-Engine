import assert from "node:assert/strict";
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import { describe, it } from "node:test";
import { loadStoredCredentials, saveStoredCredentials } from "../src/credentials.js";

describe("credentials", () => {
    it("saves and loads org_id + token", () => {
        const dir = fs.mkdtempSync(path.join(os.tmpdir(), "pde-gate-creds-"));
        const prev = process.env.PDE_GATE_CONFIG_DIR;
        process.env.PDE_GATE_CONFIG_DIR = dir;
        try {
            const file = saveStoredCredentials(
                { org_id: "acme-001", token: "tok_test" },
                { portalUrl: "https://portal.test", apiUrl: "https://api.test" }
            );
            assert.ok(fs.existsSync(file));
            const loaded = loadStoredCredentials();
            assert.equal(loaded?.org_id, "acme-001");
            assert.equal(loaded?.token, "tok_test");
        } finally {
            if (prev === undefined) delete process.env.PDE_GATE_CONFIG_DIR;
            else process.env.PDE_GATE_CONFIG_DIR = prev;
            fs.rmSync(dir, { recursive: true, force: true });
        }
    });
});
