import assert from "node:assert/strict";
import { describe, it } from "node:test";
import { isLocalCallbackUrl, startCallbackServer } from "./callback-server.js";

describe("callback-server", () => {
    it("accepts only localhost callback URLs", () => {
        assert.equal(isLocalCallbackUrl("http://127.0.0.1:45823/callback"), true);
        assert.equal(isLocalCallbackUrl("http://localhost:45823/callback"), true);
        assert.equal(isLocalCallbackUrl("https://evil.example/callback"), false);
        assert.equal(isLocalCallbackUrl("http://evil.example/callback"), false);
    });

    it("receives portal credentials via POST", async () => {
        const server = await startCallbackServer();
        try {
            const wait = server.waitForCredentials(5000);
            const res = await fetch(server.callbackUrl, {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ org_id: "acme-ab12", token: "pde_tok_test" }),
            });
            assert.equal(res.status, 200);
            const creds = await wait;
            assert.deepEqual(creds, { org_id: "acme-ab12", token: "pde_tok_test" });
        } finally {
            await server.close();
        }
    });
});
