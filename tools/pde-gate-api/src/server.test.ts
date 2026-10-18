import assert from "node:assert/strict";
import test, { after, before } from "node:test";
import type { Server } from "node:http";
import { createApp } from "./server.js";
import { sequelize } from "./db/sequelize.js";
import { issueSession } from "./session.js";

process.env.GATE_SESSION_SECRET = "test-secret-0123456789abcdef0123456789";

let server: Server;
let base: string;

before(async () => {
  server = createApp().listen(0);
  await new Promise<void>((resolve) => server.once("listening", () => resolve()));
  const { port } = server.address() as { port: number };
  base = `http://127.0.0.1:${port}`;
});

after(async () => {
  await new Promise<void>((resolve, reject) => {
    server.close((err) => (err ? reject(err) : resolve()));
  });
  await sequelize.close();
});

async function post(path: string, body: string, headers: Record<string, string> = {}) {
  const res = await fetch(`${base}${path}`, {
    method: "POST",
    headers: { "Content-Type": "application/json", ...headers },
    body,
  });
  return { status: res.status, body: (await res.json()) as { error?: string } };
}

test("health responds without DB", async () => {
  const res = await fetch(`${base}/health`);
  assert.equal(res.status, 200);
  const body = (await res.json()) as { service: string };
  assert.equal(body.service, "pde-gate-api");
});

test("register: a non-string org_name is a 400, and the server stays up", async () => {
  const res = await post("/v1/orgs/register", JSON.stringify({ org_name: 1 }));
  assert.equal(res.status, 400);
  assert.match(res.body.error!, /org_name/);
  const res2 = await post("/v1/orgs/register", JSON.stringify({ org_name: "Acme", contact_email: ["x"] }));
  assert.equal(res2.status, 400);
  assert.equal((await fetch(`${base}/health`)).status, 200);
});

test("malformed bodies are 400s with generic messages", async () => {
  const bad = await post("/v1/orgs/register", "{not json");
  assert.equal(bad.status, 400);
  assert.equal(bad.body.error, "invalid request body");
  const arr = await post("/v1/orgs/login", "[]");
  assert.equal(arr.status, 400);
  const types = await post("/v1/orgs/login", JSON.stringify({ email: 5, password: "x" }));
  assert.equal(types.status, 400);
});

test("an unexpected error is a generic 500, not the error text, and the server stays up", async () => {
  // No MySQL here: the org lookup rejects. With a DB running this is a plain 401.
  const res = await fetch(`${base}/v1/orgs/org_x/checks`, {
    method: "POST",
    headers: { Authorization: "Bearer pde_nope", "Content-Type": "application/json" },
    body: JSON.stringify({ package_id: "p", plan: {} }),
  });
  assert.ok(res.status === 500 || res.status === 401, `status ${res.status}`);
  const body = (await res.json()) as { error: string };
  if (res.status === 500) assert.equal(body.error, "internal server error");
  assert.equal((await fetch(`${base}/health`)).status, 200);
});

test("requests without a bearer key are 401 before any DB work", async () => {
  const res = await post("/v1/orgs/org_x/checks", JSON.stringify({ package_id: "p", plan: {} }));
  assert.equal(res.status, 401);
});

async function get(path: string, bearer: string) {
  const res = await fetch(`${base}${path}`, { headers: { Authorization: `Bearer ${bearer}` } });
  return { status: res.status, body: (await res.json()) as { error?: string } };
}

test("management routes need a session token: an API key is a 401 before any DB work", async () => {
  for (const path of ["/v1/orgs/org_x", "/v1/orgs/org_x/packages", "/v1/orgs/org_x/packages/pkg_1"]) {
    const res = await get(path, "pde_0123456789abcdef");
    assert.equal(res.status, 401, path);
    assert.match(res.body.error!, /session token/);
  }
  const rotate = await post("/v1/orgs/org_x/api-key/rotate", "{}", { Authorization: "Bearer pde_0123456789abcdef" });
  assert.equal(rotate.status, 401);
  assert.equal((await post("/v1/orgs/org_x/api-key/rotate", "{}")).status, 401);
});

test("sessions: another org's, an expired or a forged token is a 401", async () => {
  assert.equal((await get("/v1/orgs/org_x/packages", issueSession("org_y").token)).status, 401);
  const expired = issueSession("org_x", Date.now() - 13 * 60 * 60 * 1000).token;
  assert.equal((await get("/v1/orgs/org_x/packages", expired)).status, 401);
  const [prefix, payload] = issueSession("org_x").token.split(".");
  assert.equal((await get("/v1/orgs/org_x/packages", `${prefix}.${payload}.AAAA`)).status, 401);
});

test("checks need the API key: a session token is a 401", async () => {
  const res = await post("/v1/orgs/org_x/checks", JSON.stringify({ package_id: "p", plan: {} }), {
    Authorization: `Bearer ${issueSession("org_x").token}`,
  });
  assert.equal(res.status, 401);
  assert.match(res.body.error!, /API key/);
});
