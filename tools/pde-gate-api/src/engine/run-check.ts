import { HttpError } from "../http-error.js";
import { getPackage } from "../store.js";
import { evaluateCheck, type CheckResult } from "./evaluate.js";

export { policiesRoot, type CheckResult } from "./evaluate.js";

export type ServerCheckInput = {
  orgId: string;
  packageId: string;
  plan: Record<string, unknown>;
  platform?: string;
  strictVersions?: boolean;
};

export type ServerCheckResult = CheckResult;

/**
 * Server-side check: plan from client + package from DB + Rego from PDE repo.
 * The evaluation itself (engine/evaluate.ts) needs no database.
 */
export async function runServerCheck(input: ServerCheckInput): Promise<ServerCheckResult> {
  const pkg = await getPackage(input.orgId, input.packageId);
  if (!pkg) throw new HttpError(404, "package not found");
  return evaluateCheck({
    pkg,
    plan: input.plan,
    platform: input.platform,
    strictVersions: input.strictVersions,
  });
}
