import { randomBytes, scryptSync, timingSafeEqual } from "node:crypto";

const KEY_LEN = 64;

export function hashPassword(password: string): string {
  const salt = randomBytes(16).toString("hex");
  const derived = scryptSync(password, salt, KEY_LEN);
  return `${salt}:${derived.toString("hex")}`;
}

export function verifyPassword(password: string, combinedHash: string): boolean {
  const parts = combinedHash.split(":");
  if (parts.length !== 2) return false;
  const [salt, hashHex] = parts;
  if (!salt || !hashHex) return false;
  const expected = Buffer.from(hashHex, "hex");
  const derived = scryptSync(password, salt, KEY_LEN);
  if (expected.length !== derived.length) return false;
  return timingSafeEqual(expected, derived);
}
