import assert from "node:assert/strict";
import { describe, it, before, after } from "node:test";
import { createApp } from "./server.js";

describe("portal web server", () => {
  let server: ReturnType<typeof import("node:http").createServer>;
  let baseUrl: string;

  before(async () => {
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

  it("serves health endpoint", async () => {
    const res = await fetch(`${baseUrl}/health`);
    assert.equal(res.status, 200);
    const body = (await res.json()) as { status: string; service: string };
    assert.equal(body.status, "ok");
    assert.equal(body.service, "pde-gate-portal");
  });

  it("serves registration page", async () => {
    const res = await fetch(`${baseUrl}/register`);
    assert.equal(res.status, 200);
    const text = await res.text();
    assert.ok(text.includes("Register Organisation"));
  });

  it("serves settings page", async () => {
    const res = await fetch(`${baseUrl}/settings`);
    assert.equal(res.status, 200);
    const text = await res.text();
    assert.ok(text.includes("Organisation Settings"));
  });
});
