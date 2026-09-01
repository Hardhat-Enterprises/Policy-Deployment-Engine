import assert from "node:assert/strict";
import { describe, it, before, after } from "node:test";
import { createApp } from "./server.js";
import { resetStoreForTests } from "./store.js";

describe("portal API", () => {
    let server: ReturnType<typeof import("node:http").createServer>;
    let baseUrl: string;

    before(async () => {
        resetStoreForTests();
        const app = createApp();
        await new Promise<void>((resolve) => {
            server = app.listen(0, "127.0.0.1", () => resolve());
        });
        const addr = server.address();
        if (!addr || typeof addr === "string") throw new Error("no address");
        baseUrl = `http://127.0.0.1:${addr.port}`;
    });

    after(async () => {
        await new Promise<void>((resolve, reject) => {
            server.close((err) => (err ? reject(err) : resolve()));
        });
    });

    it("registers org and returns token", async () => {
        const res = await fetch(`${baseUrl}/v1/orgs/register`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                org_name: "Acme Bank",
                contact_email: "ops@acme.example",
                approved_regions: ["australia-southeast1"],
                policy_profile: "baseline",
            }),
        });
        assert.equal(res.status, 201);
        const body = (await res.json()) as { org_id: string; token: string };
        assert.ok(body.org_id);
        assert.ok(body.token.startsWith("pde_tok_"));
    });

    it("validates token on config fetch", async () => {
        const reg = await fetch(`${baseUrl}/v1/orgs/register`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                org_name: "Token Test Org",
                contact_email: "t@example.com",
                approved_regions: ["europe-west1"],
            }),
        });
        const { org_id, token } = (await reg.json()) as { org_id: string; token: string };

        const bad = await fetch(`${baseUrl}/v1/orgs/${org_id}/config`, {
            headers: { Authorization: "Bearer wrong-token" },
        });
        assert.equal(bad.status, 401);

        const ok = await fetch(`${baseUrl}/v1/orgs/${org_id}/config`, {
            headers: { Authorization: `Bearer ${token}` },
        });
        assert.equal(ok.status, 200);
        const config = (await ok.json()) as { org_id: string; approved_regions: string[] };
        assert.equal(config.org_id, org_id);
        assert.deepEqual(config.approved_regions, ["europe-west1"]);
        assert.equal("token" in config, false);
    });

    it("updates org config with valid token", async () => {
        const reg = await fetch(`${baseUrl}/v1/orgs/register`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                org_name: "Patch Test Org",
                contact_email: "patch@example.com",
                approved_regions: ["europe-west1"],
                policy_profile: "baseline",
            }),
        });
        const { org_id, token } = (await reg.json()) as { org_id: string; token: string };

        const patch = await fetch(`${baseUrl}/v1/orgs/${org_id}/config`, {
            method: "PATCH",
            headers: {
                Authorization: `Bearer ${token}`,
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                approved_regions: ["australia-southeast1", "australia-southeast2"],
                policy_profile: "full",
            }),
        });
        assert.equal(patch.status, 200);
        const updated = (await patch.json()) as { approved_regions: string[]; policy_profile: string };
        assert.deepEqual(updated.approved_regions, ["australia-southeast1", "australia-southeast2"]);
        assert.equal(updated.policy_profile, "full");
    });
});
