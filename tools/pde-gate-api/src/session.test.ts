/** Session tokens: signing, expiry, tampering and the production secret check. No DB. */
import assert from "node:assert/strict";
import { spawnSync } from "node:child_process";
import path from "node:path";
import test from "node:test";
import { fileURLToPath } from "node:url";
import { SESSION_TTL_SECONDS, assertSessionSecret, issueSession, verifySession } from "./session.js";

process.env.GATE_SESSION_SECRET = "test-secret-0123456789abcdef0123456789";

test("session: a fresh token verifies to its org for 12 hours", () => {
  const now = Date.UTC(2026, 9, 18, 0, 0, 0);
  const { token, expires_at } = issueSession("org_abc", now);
  assert.match(token, /^pds\.[A-Za-z0-9_-]+\.[A-Za-z0-9_-]+$/);
  assert.equal(expires_at, new Date(now + SESSION_TTL_SECONDS * 1000).toISOString());
  assert.equal(SESSION_TTL_SECONDS, 12 * 60 * 60);
  assert.equal(verifySession(token, now), "org_abc");
  assert.equal(verifySession(token, now + SESSION_TTL_SECONDS * 1000 - 1000), "org_abc");
  assert.equal(verifySession(token, now + SESSION_TTL_SECONDS * 1000), null);
});

test("session: tampered, foreign-secret and malformed tokens are rejected", () => {
  const { token } = issueSession("org_abc");
  const [prefix, payload, sig] = token.split(".") as [string, string, string];
  const forged = Buffer.from(JSON.stringify({ sub: "org_other", iat: 0, exp: 9_999_999_999 })).toString("base64url");
  assert.equal(verifySession(`${prefix}.${forged}.${sig}`), null);
  assert.equal(verifySession(`${prefix}.${payload}.${sig.slice(0, -2)}`), null);
  assert.equal(verifySession(`${prefix}.${payload}`), null);
  assert.equal(verifySession("pde_0123456789abcdef"), null);
  assert.equal(verifySession(""), null);

  process.env.GATE_SESSION_SECRET = "a-different-secret-0123456789abcdef0123";
  try {
    assert.equal(verifySession(token), null);
  } finally {
    process.env.GATE_SESSION_SECRET = "test-secret-0123456789abcdef0123456789";
  }
});

test("session: production refuses a missing or short secret", () => {
  const saved = { env: process.env.NODE_ENV, secret: process.env.GATE_SESSION_SECRET };
  try {
    process.env.NODE_ENV = "production";
    delete process.env.GATE_SESSION_SECRET;
    assert.throws(() => assertSessionSecret(), /GATE_SESSION_SECRET must be set/);
    assert.throws(() => issueSession("org_abc"), /GATE_SESSION_SECRET must be set/);
    process.env.GATE_SESSION_SECRET = "short";
    assert.throws(() => assertSessionSecret(), /at least 32 characters/);
    process.env.GATE_SESSION_SECRET = "x".repeat(32);
    assert.doesNotThrow(() => assertSessionSecret());
  } finally {
    // Assigning undefined to process.env stores the string "undefined".
    if (saved.env === undefined) delete process.env.NODE_ENV;
    else process.env.NODE_ENV = saved.env;
    process.env.GATE_SESSION_SECRET = saved.secret!;
  }
});

test("main: the server will not start in production without GATE_SESSION_SECRET", () => {
  const here = path.dirname(fileURLToPath(import.meta.url));
  const env: NodeJS.ProcessEnv = { ...process.env, NODE_ENV: "production" };
  delete env.GATE_SESSION_SECRET;
  const run = spawnSync(process.execPath, ["--import", "tsx", path.join(here, "main.ts")], {
    cwd: path.dirname(here),
    env,
    encoding: "utf8",
    timeout: 30_000,
  });
  assert.equal(run.status, 1);
  assert.match(run.stderr, /GATE_SESSION_SECRET must be set/);
});
