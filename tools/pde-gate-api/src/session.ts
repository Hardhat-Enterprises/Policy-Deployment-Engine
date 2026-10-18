import { createHmac, randomBytes, timingSafeEqual } from "node:crypto";

/**
 * Portal / CLI sessions: a short-lived token from `login`, HMAC-SHA256-signed with
 * GATE_SESSION_SECRET. It manages the org and its packages; it is never an API key,
 * so logging in does not touch the key a CI pipeline uses for checks.
 *
 * Token: `pds.<base64url payload>.<base64url signature>`, payload {sub: org_id, iat, exp}.
 */

export const SESSION_TTL_SECONDS = 12 * 60 * 60;
const PREFIX = "pds";
const MIN_SECRET_LENGTH = 32;

let ephemeralSecret: Buffer | null = null;

/**
 * Refuse to run in production without a real secret. Outside production a missing
 * secret falls back to a random per-process one (sessions end on restart).
 */
export function assertSessionSecret(): void {
  if (process.env.NODE_ENV !== "production") return;
  const secret = process.env.GATE_SESSION_SECRET ?? "";
  if (secret.length < MIN_SECRET_LENGTH) {
    throw new Error(
      `GATE_SESSION_SECRET must be set (at least ${MIN_SECRET_LENGTH} characters) when NODE_ENV=production`
    );
  }
}

function secret(): Buffer {
  const configured = process.env.GATE_SESSION_SECRET;
  if (configured) return Buffer.from(configured, "utf8");
  assertSessionSecret();
  if (!ephemeralSecret) {
    ephemeralSecret = randomBytes(32);
    console.warn("GATE_SESSION_SECRET is not set: using a random secret; sessions end when the server restarts.");
  }
  return ephemeralSecret;
}

function sign(payload: string): Buffer {
  return createHmac("sha256", secret()).update(`${PREFIX}.${payload}`, "utf8").digest();
}

export function issueSession(orgId: string, now = Date.now()): { token: string; expires_at: string } {
  const iat = Math.floor(now / 1000);
  const exp = iat + SESSION_TTL_SECONDS;
  const payload = Buffer.from(JSON.stringify({ sub: orgId, iat, exp }), "utf8").toString("base64url");
  return {
    token: `${PREFIX}.${payload}.${sign(payload).toString("base64url")}`,
    expires_at: new Date(exp * 1000).toISOString(),
  };
}

export function isSessionToken(token: string): boolean {
  return token.startsWith(`${PREFIX}.`);
}

/** The org id a valid, unexpired token was issued for, or null. */
export function verifySession(token: string, now = Date.now()): string | null {
  const parts = token.split(".");
  if (parts.length !== 3 || parts[0] !== PREFIX) return null;
  const [, payload, signature] = parts as [string, string, string];
  const presented = Buffer.from(signature, "base64url");
  const expected = sign(payload);
  if (presented.length !== expected.length || !timingSafeEqual(presented, expected)) return null;
  let claims: { sub?: unknown; exp?: unknown };
  try {
    claims = JSON.parse(Buffer.from(payload, "base64url").toString("utf8"));
  } catch {
    return null;
  }
  if (typeof claims.sub !== "string" || typeof claims.exp !== "number") return null;
  if (claims.exp * 1000 <= now) return null;
  return claims.sub;
}
