/**
 * API integration tests — need MySQL via tools/pde-gate-api/.env
 * Cases that break auth, validation, and package CRUD.
 */
import assert from "node:assert/strict";
import test, { after } from "node:test";
import dotenv from "dotenv";
import { createApp } from "./server.js";
import { sequelize } from "./db/sequelize.js";
import "./db/models/index.js";

dotenv.config();

after(async () => {
  await sequelize.close();
});

type ServerHandle = {
  base: string;
  close: () => Promise<void>;
};

async function startServer(): Promise<ServerHandle> {
  await sequelize.authenticate();
  const app = createApp();
  const server = app.listen(0);
  await new Promise<void>((resolve) => server.once("listening", () => resolve()));
  const { port } = server.address() as { port: number };
  return {
    base: `http://127.0.0.1:${port}`,
    close: () =>
      new Promise((resolve, reject) => {
        server.close((err) => (err ? reject(err) : resolve()));
      }),
  };
}

async function json(
  base: string,
  method: string,
  path: string,
  opts?: { key?: string; body?: unknown }
): Promise<{ status: number; body: unknown }> {
  const headers: Record<string, string> = { Accept: "application/json" };
  if (opts?.key) headers.Authorization = `Bearer ${opts.key}`;
  if (opts?.body !== undefined) headers["Content-Type"] = "application/json";
  const res = await fetch(`${base}${path}`, {
    method,
    headers,
    body: opts?.body !== undefined ? JSON.stringify(opts.body) : undefined,
  });
  const text = await res.text();
  let body: unknown = null;
  if (text) {
    try {
      body = JSON.parse(text);
    } catch {
      body = text;
    }
  }
  return { status: res.status, body };
}

test("API: health", async () => {
  const srv = await startServer();
  try {
    const { status, body } = await json(srv.base, "GET", "/health");
    assert.equal(status, 200);
    assert.equal((body as { service: string }).service, "pde-gate-api");
  } finally {
    await srv.close();
  }
});

test("API: register validation — missing fields", async () => {
  const srv = await startServer();
  try {
    const missingName = await json(srv.base, "POST", "/v1/orgs/register", {
      body: { contact_email: "a@b.com" },
    });
    assert.equal(missingName.status, 400);

    const missingEmail = await json(srv.base, "POST", "/v1/orgs/register", {
      body: { org_name: "Acme" },
    });
    assert.equal(missingEmail.status, 400);
  } finally {
    await srv.close();
  }
});

test("API: register → login → auth → package CRUD lifecycle", async () => {
  const srv = await startServer();
  const testEmail = `test-${Date.now()}-${Math.random().toString(36).slice(2, 7)}@example.com`;
  const testPassword = "super-secret-password-123";
  try {
    const reg = await json(srv.base, "POST", "/v1/orgs/register", {
      body: { org_name: "Test Org", contact_email: testEmail, password: testPassword },
    });
    assert.equal(reg.status, 201);
    const { org_id, api_key } = reg.body as { org_id: string; api_key: string };
    assert.ok(org_id.startsWith("org_"));
    assert.ok(api_key.startsWith("pde_"));

    // Test Login / API key recovery
    const loginOk = await json(srv.base, "POST", "/v1/orgs/login", {
      body: { email: testEmail, password: testPassword },
    });
    assert.equal(loginOk.status, 200);
    assert.equal((loginOk.body as { api_key: string }).api_key, api_key);

    const loginFail = await json(srv.base, "POST", "/v1/orgs/login", {
      body: { email: testEmail, password: "wrong-password" },
    });
    assert.equal(loginFail.status, 401);

    const noAuth = await json(srv.base, "GET", `/v1/orgs/${org_id}`);
    assert.equal(noAuth.status, 401);

    const badKey = await json(srv.base, "GET", `/v1/orgs/${org_id}`, {
      key: "wrong",
    });
    assert.equal(badKey.status, 401);

    const me = await json(srv.base, "GET", `/v1/orgs/${org_id}`, { key: api_key });
    assert.equal(me.status, 200);
    assert.equal((me.body as { org_name: string }).org_name, "Test Org");

    const createMissingName = await json(srv.base, "POST", `/v1/orgs/${org_id}/packages`, {
      key: api_key,
      body: { policy_groups: {} },
    });
    assert.equal(createMissingName.status, 400);

    const created = await json(srv.base, "POST", `/v1/orgs/${org_id}/packages`, {
      key: api_key,
      body: {
        name: "baseline",
        platforms: ["gcp"],
        policy_groups: { google_vpc_access_connector: ["region"] },
        variables: { approved_regions: ["australia-southeast1"] },
      },
    });
    assert.equal(created.status, 201);
    const pkg = created.body as {
      package_id: string;
      platforms: string[];
      policy_groups: Record<string, string[]>;
    };
    assert.ok(pkg.package_id.startsWith("pkg_"));
    assert.deepEqual(pkg.platforms, ["gcp"]);
    assert.deepEqual(pkg.policy_groups.google_vpc_access_connector, ["region"]);

    const listed = await json(srv.base, "GET", `/v1/orgs/${org_id}/packages`, {
      key: api_key,
    });
    assert.equal(listed.status, 200);
    assert.equal((listed.body as { packages: unknown[] }).packages.length >= 1, true);

    const shown = await json(
      srv.base,
      "GET",
      `/v1/orgs/${org_id}/packages/${pkg.package_id}`,
      { key: api_key }
    );
    assert.equal(shown.status, 200);

    const patched = await json(
      srv.base,
      "PATCH",
      `/v1/orgs/${org_id}/packages/${pkg.package_id}`,
      {
        key: api_key,
        body: { name: "baseline-v2", variables: { approved_regions: ["australia-southeast2"] } },
      }
    );
    assert.equal(patched.status, 200);
    assert.equal((patched.body as { name: string }).name, "baseline-v2");

    const missing = await json(
      srv.base,
      "GET",
      `/v1/orgs/${org_id}/packages/pkg_does_not_exist`,
      { key: api_key }
    );
    assert.equal(missing.status, 404);

    const otherOrg = await json(srv.base, "GET", `/v1/orgs/org_other/packages`, {
      key: api_key,
    });
    assert.equal(otherOrg.status, 401);

    const del = await json(
      srv.base,
      "DELETE",
      `/v1/orgs/${org_id}/packages/${pkg.package_id}`,
      { key: api_key }
    );
    assert.equal(del.status, 204);

    const gone = await json(
      srv.base,
      "GET",
      `/v1/orgs/${org_id}/packages/${pkg.package_id}`,
      { key: api_key }
    );
    assert.equal(gone.status, 404);
  } finally {
    await srv.close();
  }
});
