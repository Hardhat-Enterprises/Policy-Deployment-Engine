import assert from "node:assert/strict";
import test, { after, before } from "node:test";
import type { Server } from "node:http";
import { createApp } from "./server.js";
import { sequelize } from "./db/sequelize.js";

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
  // No MySQL here: the auth lookup rejects. With a DB running this is a plain 401.
  const res = await fetch(`${base}/v1/orgs/org_x/packages`, {
    headers: { Authorization: "Bearer pde_nope" },
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
