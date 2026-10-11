import assert from "node:assert/strict";
import test from "node:test";
import { createApp } from "./server.js";

test("health responds without DB", async () => {
  const app = createApp();
  const server = app.listen(0);
  const { port } = server.address() as { port: number };
  const res = await fetch(`http://127.0.0.1:${port}/health`);
  assert.equal(res.status, 200);
  const body = (await res.json()) as { service: string };
  assert.equal(body.service, "pde-gate-api");
  await new Promise<void>((resolve, reject) => {
    server.close((err) => (err ? reject(err) : resolve()));
  });
});
