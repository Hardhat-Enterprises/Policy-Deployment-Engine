/**
 * API integration tests — need MySQL via tools/pde-gate-api/.env, migrated
 * (`npm run db:migrate`). Skipped when no database is reachable.
 * Cases that break auth, validation, and package CRUD.
 */
import assert from "node:assert/strict";
import test, { after } from "node:test";
import dotenv from "dotenv";
import { createApp } from "./server.js";
import { sequelize } from "./db/sequelize.js";
import "./db/models/index.js";

dotenv.config();
process.env.GATE_SESSION_SECRET ??= "test-secret-0123456789abcdef0123456789";

const dbAvailable = await sequelize.authenticate().then(
  () => true,
  () => false
);
const opts = { skip: dbAvailable ? false : "no MySQL reachable (see tools/pde-gate-api/.env)" };

after(async () => {
  await sequelize.close();
});

type ServerHandle = {
  base: string;
  close: () => Promise<void>;
};

async function startServer(): Promise<ServerHandle> {
  await sequelize.authenticate();
  // Loose limits: this file registers and logs in more often than the defaults allow.
  const loose = { max: 1000, windowMs: 60_000 };
  const app = createApp({ rateLimits: { login: loose, register: loose } });
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

test("API: health", opts, async () => {
  const srv = await startServer();
  try {
    const { status, body } = await json(srv.base, "GET", "/health");
    assert.equal(status, 200);
    assert.equal((body as { service: string }).service, "pde-gate-api");
  } finally {
    await srv.close();
  }
});

test("API: register validation — missing fields", opts, async () => {
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

test("API: register → login → auth → package CRUD lifecycle", opts, async () => {
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
    assert.match((reg.body as { session_token: string }).session_token, /^pds\./);

    // Login returns a session token and leaves the API key alone.
    const loginOk = await json(srv.base, "POST", "/v1/orgs/login", {
      body: { email: testEmail, password: testPassword },
    });
    assert.equal(loginOk.status, 200);
    const login = loginOk.body as { session_token: string; session_expires_at: string; api_key?: string };
    assert.equal(login.api_key, undefined);
    const session = login.session_token;
    assert.match(session, /^pds\./);
    const ttl = Date.parse(login.session_expires_at) - Date.now();
    assert.ok(ttl > 11.9 * 3600_000 && ttl <= 12 * 3600_000, `session ttl ${ttl}`);

    const loginFail = await json(srv.base, "POST", "/v1/orgs/login", {
      body: { email: testEmail, password: "wrong-password" },
    });
    assert.equal(loginFail.status, 401);

    // Passwords are never trimmed: surrounding spaces are part of the password.
    const paddedEmail = `padded-${testEmail}`;
    const padded = "  padded secret pw  ";
    const regPadded = await json(srv.base, "POST", "/v1/orgs/register", {
      body: { org_name: "Padded Org", contact_email: paddedEmail, password: padded },
    });
    assert.equal(regPadded.status, 201);
    const loginPadded = (password: string) =>
      json(srv.base, "POST", "/v1/orgs/login", { body: { email: paddedEmail, password } });
    assert.equal((await loginPadded(padded)).status, 200);
    assert.equal((await loginPadded(padded.trim())).status, 401);

    const shortPassword = await json(srv.base, "POST", "/v1/orgs/register", {
      body: { org_name: "Short", contact_email: `short-${testEmail}`, password: "elevenchars" },
    });
    assert.equal(shortPassword.status, 400);
    const noPassword = await json(srv.base, "POST", "/v1/orgs/register", {
      body: { org_name: "None", contact_email: `none-${testEmail}` },
    });
    assert.equal(noPassword.status, 400);

    const noAuth = await json(srv.base, "GET", `/v1/orgs/${org_id}`);
    assert.equal(noAuth.status, 401);

    const badKey = await json(srv.base, "GET", `/v1/orgs/${org_id}`, {
      key: "wrong",
    });
    assert.equal(badKey.status, 401);

    // The API key runs checks only; it does not manage the org.
    const keyOnManagement = await json(srv.base, "GET", `/v1/orgs/${org_id}`, { key: api_key });
    assert.equal(keyOnManagement.status, 401);

    const me = await json(srv.base, "GET", `/v1/orgs/${org_id}`, { key: session });
    assert.equal(me.status, 200);
    assert.equal((me.body as { org_name: string }).org_name, "Test Org");

    const createMissingName = await json(srv.base, "POST", `/v1/orgs/${org_id}/packages`, {
      key: session,
      body: { policy_groups: {} },
    });
    assert.equal(createMissingName.status, 400);

    const createUnknownArgument = await json(srv.base, "POST", `/v1/orgs/${org_id}/packages`, {
      key: session,
      body: { name: "bad", policy_groups: { google_vpc_access_connector: ["network"] } },
    });
    assert.equal(createUnknownArgument.status, 400);

    const createAwsRegion = await json(srv.base, "POST", `/v1/orgs/${org_id}/packages`, {
      key: session,
      body: { name: "bad", variables: { approved_regions: ["us-east-1"] } },
    });
    assert.equal(createAwsRegion.status, 400);

    const created = await json(srv.base, "POST", `/v1/orgs/${org_id}/packages`, {
      key: session,
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
      key: session,
    });
    assert.equal(listed.status, 200);
    assert.equal((listed.body as { packages: unknown[] }).packages.length >= 1, true);

    const shown = await json(
      srv.base,
      "GET",
      `/v1/orgs/${org_id}/packages/${pkg.package_id}`,
      { key: session }
    );
    assert.equal(shown.status, 200);

    const patched = await json(
      srv.base,
      "PATCH",
      `/v1/orgs/${org_id}/packages/${pkg.package_id}`,
      {
        key: session,
        body: { name: "baseline-v2", variables: { approved_regions: ["australia-southeast2"] } },
      }
    );
    assert.equal(patched.status, 200);
    assert.equal((patched.body as { name: string }).name, "baseline-v2");

    const missing = await json(
      srv.base,
      "GET",
      `/v1/orgs/${org_id}/packages/pkg_does_not_exist`,
      { key: session }
    );
    assert.equal(missing.status, 404);

    const otherOrg = await json(srv.base, "GET", `/v1/orgs/org_other/packages`, {
      key: session,
    });
    assert.equal(otherOrg.status, 401);

    // Checks: the registration key works, also after the login above.
    const plan = {
      terraform_version: "1.9.0",
      format_version: "1.2",
      planned_values: {
        root_module: {
          resources: [{ type: "google_vpc_access_connector", name: "c", values: { region: "australia-southeast1" } }],
        },
      },
    };
    const check = (key: string) =>
      json(srv.base, "POST", `/v1/orgs/${org_id}/checks`, {
        key,
        body: { package_id: pkg.package_id, plan, strict_versions: false },
      });
    const firstCheck = await check(api_key);
    assert.ok([200, 422].includes(firstCheck.status), `check status ${firstCheck.status}`);
    assert.equal((await check(session)).status, 401);

    // Rotation needs a session; afterwards only the new key runs checks.
    assert.equal((await json(srv.base, "POST", `/v1/orgs/${org_id}/api-key/rotate`, { key: api_key })).status, 401);
    const rotated = await json(srv.base, "POST", `/v1/orgs/${org_id}/api-key/rotate`, { key: session });
    assert.equal(rotated.status, 200);
    const newKey = (rotated.body as { api_key: string }).api_key;
    assert.ok(newKey.startsWith("pde_"));
    assert.notEqual(newKey, api_key);
    assert.equal((await check(api_key)).status, 401);
    assert.ok([200, 422].includes((await check(newKey)).status));

    const del = await json(
      srv.base,
      "DELETE",
      `/v1/orgs/${org_id}/packages/${pkg.package_id}`,
      { key: session }
    );
    assert.equal(del.status, 204);

    const gone = await json(
      srv.base,
      "GET",
      `/v1/orgs/${org_id}/packages/${pkg.package_id}`,
      { key: session }
    );
    assert.equal(gone.status, 404);
  } finally {
    await srv.close();
  }
});
