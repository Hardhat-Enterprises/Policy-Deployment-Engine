import { spawn } from "node:child_process";
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import { POLICY_FILE, VARS_FILE, type PolicyTarget } from "./policy-select.js";

/**
 * OPA evaluation of one argument policy, plus the org-value substitution.
 *
 * Kept byte-identical in tools/pde-gate-api/src/engine/ and tools/pde-gate/src/;
 * the CLI's unit tests fail if the two copies drift.
 */

export class OpaError extends Error {}

function runOpa(args: string[]): Promise<{ stdout: string; stderr: string }> {
  return new Promise((resolve, reject) => {
    const child = spawn("opa", args, { stdio: ["ignore", "pipe", "pipe"] });
    let stdout = "";
    let stderr = "";
    child.stdout.on("data", (c: Buffer) => {
      stdout += c.toString();
    });
    child.stderr.on("data", (c: Buffer) => {
      stderr += c.toString();
    });
    child.on("error", (err) => reject(new OpaError(`could not run opa: ${err.message}`)));
    child.on("close", (code) => {
      if (code === 0) resolve({ stdout, stderr });
      // --format json puts compile errors on stdout, other failures on stderr.
      else reject(new OpaError((stderr || stdout || `opa exited ${code}`).trim()));
    });
  });
}

/**
 * `data.<package>.message` for one policy, or null when it is undefined.
 *
 * `dataFiles` must be explicit files/dirs: the shared helpers, the resource's
 * _vars.rego and the policy. Never a resource or platform folder — that would
 * load the committed <sha>.json fixture plans as OPA data.
 */
export async function opaEvalMessage(
  dataFiles: string[],
  inputPath: string,
  packageName: string
): Promise<unknown> {
  const args = ["eval"];
  for (const file of dataFiles) args.push("--data", file);
  args.push("--input", inputPath, "--format", "json", `data.${packageName}.message`);
  const { stdout } = await runOpa(args);
  let payload: { result?: { expressions?: { value?: unknown }[] }[] };
  try {
    payload = JSON.parse(stdout);
  } catch {
    throw new OpaError("unreadable opa output");
  }
  return payload?.result?.[0]?.expressions?.[0]?.value ?? null;
}

export function isPolicyFailure(message: unknown): boolean {
  const text = JSON.stringify(message ?? "");
  // Match "Non-Compliant Resources: <something>" that is not the all-passed marker.
  const re = /Non-Compliant Resources:\s*([^"]*)/g;
  let m: RegExpExecArray | null;
  while ((m = re.exec(text)) !== null) {
    const value = (m[1] ?? "").trim();
    if (value && !value.startsWith("None - All passed")) return true;
  }
  return false;
}

/** The marker policies/_helpers put on a policy it refuses to evaluate (see auto_test.py). */
export const POLICY_ERROR_PREFIX = "POLICY ERROR:";

/**
 * The helper's own hard-error text, from "POLICY ERROR:" onwards, or null. Searched
 * for anywhere: OPA returns the message as nested arrays, so the marker may sit at
 * any depth and not at the start of a string.
 */
export function policyErrorText(message: unknown): string | null {
  if (typeof message === "string") {
    const index = message.indexOf(POLICY_ERROR_PREFIX);
    return index === -1 ? null : message.slice(index).trim();
  }
  const children = Array.isArray(message)
    ? message
    : typeof message === "object" && message !== null
      ? Object.values(message)
      : [];
  for (const child of children) {
    const text = policyErrorText(child);
    if (text !== null) return text;
  }
  return null;
}

/** policy_type is matched case-insensitively: policies spell it "whitelist" and "Whitelist". */
const CONTENT_SECURITY = /"policy_type"\s*:\s*"content security"/i;
const WHITELIST = /"policy_type"\s*:\s*"whitelist"/i;

/** Content-security policies read Bandit findings that this check does not produce. */
export function needsContentAnalysis(policyFile: string): boolean {
  return CONTENT_SECURITY.test(fs.readFileSync(policyFile, "utf8"));
}

export function writeTempInput(plan: unknown): string {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "pde-gate-"));
  const file = path.join(dir, "input.json");
  fs.writeFileSync(file, JSON.stringify(plan));
  return file;
}

// --------------------------------------------------------------------------
// Org values: a package's approved_regions / approved_zones replace the values
// of a policy's single-attribute region / zone / location whitelist.
// --------------------------------------------------------------------------

const ORG_VALUE_ATTRIBUTES: Record<string, { variable: string; shape: RegExp }> = {
  region: { variable: "approved_regions", shape: /^[a-z]+-[a-z]+\d+$/i },
  zone: { variable: "approved_zones", shape: /^[a-z]+-[a-z]+\d+-[a-z]$/i },
  location: { variable: "approved_regions", shape: /^[a-z]+-[a-z]+\d+$/i },
};

/** A condition object: no nested braces in PDE conditions. */
const CONDITION_OBJECT = /\{[^{}]*\}/g;
const VALUES_ARRAY = /("values"\s*:\s*)\[([^[\]]*)\]/;

/** The org's non-empty list for `variable`, or null (absent or empty keeps the policy's own values). */
function approvedValues(orgConfig: Record<string, unknown>, variable: string): string[] | null {
  const list = orgConfig?.[variable];
  if (!Array.isArray(list) || list.length === 0) return null;
  if (!list.every((v) => typeof v === "string" && v.trim() !== "")) return null;
  return list as string[];
}

/**
 * Replace region / zone / location whitelist values with the org's, but only when
 * the org set a non-empty list and the policy's own values are all of that shape
 * (so `["global"]` or `["US", "EU"]` locations are left alone). Location values
 * keep the case the policy uses (google_storage_bucket/location is upper case).
 */
export function substituteOrgValues(
  text: string,
  orgConfig: Record<string, unknown>
): { text: string; warnings: string[] } {
  const warnings: string[] = [];
  const out = text.replace(CONDITION_OBJECT, (obj) => {
    const attr = obj.match(/"attribute_path"\s*:\s*\[\s*"([a-z_]+)"\s*\]/)?.[1];
    const spec = attr ? ORG_VALUE_ATTRIBUTES[attr] : undefined;
    if (!attr || !spec) return obj;
    if (!WHITELIST.test(obj)) return obj;
    const approved = approvedValues(orgConfig, spec.variable);
    if (!approved) return obj;
    const values = obj.match(VALUES_ARRAY);
    if (!values) return obj;
    const original = [...values[2]!.matchAll(/"([^"]*)"/g)].map((m) => m[1]!);
    if (original.length === 0 || !original.every((v) => spec.shape.test(v))) {
      warnings.push(
        `${attr} whitelist values ${JSON.stringify(original)} are not ${spec.variable} names; ` +
          `kept the policy's own values`
      );
      return obj;
    }
    let replacement = approved;
    if (attr === "location") {
      const upper = original.every((v) => v === v.toUpperCase());
      replacement = approved.map((v) => (upper ? v.toUpperCase() : v.toLowerCase()));
    }
    return obj.replace(VALUES_ARRAY, (_all, prefix: string) => `${prefix}${JSON.stringify(replacement)}`);
  });
  return { text: out, warnings };
}

/**
 * The data files for one policy. When the org values change the policy, a JIT
 * copy is written under `tempBaseDir` as <rt>/_vars.rego and <rt>/<arg>/policy.rego;
 * otherwise the policy's own files are used.
 */
export function writeJitPolicyDir(
  target: PolicyTarget,
  tempBaseDir: string,
  orgConfig: Record<string, unknown>
): { varsFile: string; policyFile: string; warnings: string[] } {
  const original = fs.readFileSync(target.policyFile, "utf8");
  const { text, warnings } = substituteOrgValues(original, orgConfig);
  if (text === original) {
    return { varsFile: target.varsFile, policyFile: target.policyFile, warnings };
  }
  const resourceDir = path.join(tempBaseDir, target.resourceType);
  const argumentDir = path.join(resourceDir, target.argument);
  fs.mkdirSync(argumentDir, { recursive: true });
  const varsFile = path.join(resourceDir, VARS_FILE);
  if (!fs.existsSync(varsFile)) fs.copyFileSync(target.varsFile, varsFile);
  const policyFile = path.join(argumentDir, POLICY_FILE);
  fs.writeFileSync(policyFile, text);
  return { varsFile, policyFile, warnings };
}
