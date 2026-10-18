import assert from "node:assert/strict";
import express from "express";
import vm from "node:vm";
import { describe, it, before, after } from "node:test";
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { createApp } from "./server.js";

const fsText = (name: string) =>
  fs.readFileSync(path.join(path.dirname(fileURLToPath(import.meta.url)), "..", "public", name), "utf8");

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

  it("serves policy package builder", async () => {
    const res = await fetch(`${baseUrl}/packages`);
    assert.equal(res.status, 200);
    const text = await res.text();
    assert.ok(text.includes("Policy package builder"));
    assert.ok(text.includes("Available policy catalog"));
  });

  it("serves policy check page", async () => {
    const res = await fetch(`${baseUrl}/check`);
    assert.equal(res.status, 200);
    const text = await res.text();
    assert.ok(text.includes("Run policy check"));
    assert.ok(text.includes("Terraform plan.json"));
  });
});

describe("portal pages after the session / API-key split", () => {
  let server: ReturnType<typeof import("node:http").createServer>;
  let baseUrl: string;

  before(async () => {
    await new Promise<void>((resolve) => {
      server = createApp().listen(0, "127.0.0.1", () => resolve());
    });
    baseUrl = `http://127.0.0.1:${(server.address() as { port: number }).port}`;
  });

  after(async () => {
    await new Promise<void>((resolve) => server.close(() => resolve()));
  });

  const page = async (path: string) => (await fetch(`${baseUrl}${path}`)).text();

  it("every page's scripts parse", async () => {
    for (const path of ["/register", "/packages", "/settings", "/check"]) {
      const text = await page(path);
      const scripts = [...text.matchAll(/<script>([\s\S]*?)<\/script>/g)].map((m) => m[1]!);
      assert.ok(scripts.length > 0, path);
      for (const code of scripts) assert.doesNotThrow(() => new vm.Script(code), path);
    }
    assert.doesNotThrow(() => new vm.Script(fsText("session.js")));
  });

  it("serves the shared sign-in script", async () => {
    const res = await fetch(`${baseUrl}/session.js`);
    assert.equal(res.status, 200);
    const text = await res.text();
    assert.ok(text.includes("/v1/orgs/login"));
    assert.ok(text.includes("session_token"));
  });

  it("package management pages sign in with a session, not the API key", async () => {
    for (const path of ["/packages", "/settings", "/check"]) {
      const text = await page(path);
      assert.ok(text.includes('<script src="/session.js"></script>'), path);
      assert.ok(text.includes("PdeSession.mount("), path);
    }
    assert.ok(!(await page("/packages")).includes('id="api_key"'));
    assert.ok(!(await page("/settings")).includes('id="api_key"'));
    // The check itself still runs with the API key.
    assert.ok((await page("/check")).includes('id="api_key"'));
  });

  it("the API key is never stored: shown once at register / rotate, pasted for a check", async () => {
    for (const path of ["/register", "/packages", "/settings", "/check"]) {
      const text = await page(path);
      assert.ok(!/sessionStorage\.setItem\([^)]*api_key/.test(text), path);
      assert.ok(!text.includes('getItem("pde_api_key")'), path);
    }
    assert.ok(!fsText("session.js").includes("api_key\""));
    const register = await page("/register");
    assert.ok(register.includes("PdeSession.showOneTimeKey("));
    // No ?callback= hand-off: the key is never posted to another URL.
    assert.ok(!/callback/i.test(register));
    const settings = await page("/settings");
    assert.ok(settings.includes("Rotate API key"));
    assert.ok(settings.includes('"/api-key/rotate"'));
    assert.ok(settings.includes("PdeSession.showOneTimeKey(rotatedKey, data.api_key)"));
    const session = fsText("session.js");
    assert.ok(session.includes("navigator.clipboard.writeText"));
    assert.ok(session.includes("store it as "));
  });

  it("session.js sends a 401 back to sign-in and explains a 429", () => {
    const session = fsText("session.js");
    assert.ok(/response\.status === 401[\s\S]*?clear\(\);[\s\S]*?onSignedOut\(\)/.test(session));
    assert.ok(session.includes("response.status === 429"));
    assert.ok(session.includes("Too many attempts"));
  });

  it("register uses the session token for the first package and asks for 12+ characters", async () => {
    const text = await page("/register");
    assert.ok(text.includes("registrationData.session_token"));
    assert.ok(text.includes('minlength="12"'));
  });

  it("policy help text names arguments, and there is no baseline profile", async () => {
    for (const path of ["/register", "/settings"]) {
      const text = await page(path);
      assert.ok(!text.includes("filenames without"), path);
      assert.ok(text.includes("argument names"), path);
      assert.ok(!text.includes('value="baseline"'), path);
      assert.ok(!text.includes("region, network"), path);
    }
  });
});

describe("portal API proxy", () => {
  let api: ReturnType<typeof import("node:http").createServer>;
  let portal: ReturnType<typeof import("node:http").createServer>;
  let portalUrl: string;
  const seen: { authorization?: string; forwardedFor?: string; body?: unknown }[] = [];

  before(async () => {
    const fake = express();
    fake.use(express.json());
    fake.all("/v1/*", (req, res) => {
      seen.push({
        authorization: req.header("authorization"),
        forwardedFor: req.header("x-forwarded-for"),
        body: req.body,
      });
      res.status(201).json({ ok: true });
    });
    await new Promise<void>((resolve) => {
      api = fake.listen(0, "127.0.0.1", () => resolve());
    });
    const apiUrl = `http://127.0.0.1:${(api.address() as { port: number }).port}`;
    await new Promise<void>((resolve) => {
      portal = createApp({ apiUrl }).listen(0, "127.0.0.1", () => resolve());
    });
    portalUrl = `http://127.0.0.1:${(portal.address() as { port: number }).port}`;
  });

  after(async () => {
    await new Promise<void>((resolve) => portal.close(() => resolve()));
    await new Promise<void>((resolve) => api.close(() => resolve()));
  });

  it("passes the bearer token, the body and the client address through", async () => {
    const res = await fetch(`${portalUrl}/v1/orgs/login`, {
      method: "POST",
      headers: { "Content-Type": "application/json", Authorization: "Bearer pds.x.y" },
      body: JSON.stringify({ email: "a@example.com", password: " spaced password " }),
    });
    assert.equal(res.status, 201);
    const last = seen.at(-1)!;
    assert.equal(last.authorization, "Bearer pds.x.y");
    assert.deepEqual(last.body, { email: "a@example.com", password: " spaced password " });
    assert.match(last.forwardedFor!, /127\.0\.0\.1$/);
  });

  it("appends to an incoming X-Forwarded-For rather than replacing it", async () => {
    await fetch(`${portalUrl}/v1/orgs/login`, {
      method: "POST",
      headers: { "Content-Type": "application/json", "X-Forwarded-For": "203.0.113.7" },
      body: "{}",
    });
    assert.match(seen.at(-1)!.forwardedFor!, /^203\.0\.113\.7, .*127\.0\.0\.1$/);
  });
});
