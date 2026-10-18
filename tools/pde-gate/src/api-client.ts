import type { PolicyPackage } from "./plugins/types.js";

/** `bearer` is the session token for org/package routes, the API key for checks. */
async function api<T>(
  apiUrl: string,
  bearer: string | null,
  method: string,
  path: string,
  body?: unknown
): Promise<T> {
  const headers: Record<string, string> = { Accept: "application/json" };
  if (bearer) headers.Authorization = `Bearer ${bearer}`;
  if (body !== undefined) headers["Content-Type"] = "application/json";
  const res = await fetch(`${apiUrl.replace(/\/$/, "")}${path}`, {
    method,
    headers,
    body: body !== undefined ? JSON.stringify(body) : undefined,
  });
  if (!res.ok) {
    const text = await res.text();
    throw new Error(`${method} ${path} → ${res.status}: ${text}`);
  }
  if (res.status === 204) return undefined as T;
  return (await res.json()) as T;
}

export async function registerOrg(
  apiUrl: string,
  input: { org_name: string; contact_email: string; password?: string }
): Promise<{ org_id: string; api_key: string } & Session> {
  return api(apiUrl, null, "POST", "/v1/orgs/register", input);
}

export type Session = { session_token: string; session_expires_at: string };

/** Email + password → a 12h session token. The API key is not changed. */
export async function loginOrg(
  apiUrl: string,
  input: { email: string; password?: string }
): Promise<{ org_id: string } & Session> {
  return api(apiUrl, null, "POST", "/v1/orgs/login", input);
}

/** Needs a session. Issues a new API key and revokes the old one. */
export async function rotateApiKey(
  apiUrl: string,
  orgId: string,
  session: string
): Promise<{ org_id: string; api_key: string }> {
  return api(apiUrl, session, "POST", `/v1/orgs/${orgId}/api-key/rotate`);
}

export async function getOrg(
  apiUrl: string,
  orgId: string,
  session: string
): Promise<{ org_id: string; org_name: string }> {
  return api(apiUrl, session, "GET", `/v1/orgs/${orgId}`);
}

export async function listPackages(
  apiUrl: string,
  orgId: string,
  session: string
): Promise<PolicyPackage[]> {
  const data = await api<{ packages: PolicyPackage[] }>(
    apiUrl,
    session,
    "GET",
    `/v1/orgs/${orgId}/packages`
  );
  return data.packages;
}

export async function getPackage(
  apiUrl: string,
  orgId: string,
  session: string,
  packageId: string
): Promise<PolicyPackage> {
  return api(apiUrl, session, "GET", `/v1/orgs/${orgId}/packages/${packageId}`);
}

export async function createPackage(
  apiUrl: string,
  orgId: string,
  session: string,
  body: {
    name: string;
    description?: string;
    platforms?: string[];
    policy_groups?: Record<string, string[]>;
    variables?: Record<string, unknown>;
  }
): Promise<PolicyPackage> {
  return api(apiUrl, session, "POST", `/v1/orgs/${orgId}/packages`, body);
}

export async function deletePackage(
  apiUrl: string,
  orgId: string,
  session: string,
  packageId: string
): Promise<void> {
  await api(apiUrl, session, "DELETE", `/v1/orgs/${orgId}/packages/${packageId}`);
}

export async function updatePackage(
  apiUrl: string,
  orgId: string,
  session: string,
  packageId: string,
  body: {
    name?: string;
    description?: string;
    platforms?: string[];
    policy_groups?: Record<string, string[]>;
    variables?: Record<string, unknown>;
  }
): Promise<PolicyPackage> {
  return api(apiUrl, session, "PATCH", `/v1/orgs/${orgId}/packages/${packageId}`, body);
}

type PolicyRef = { policy: string; resource_type?: string; argument?: string };

export type CheckResult = {
  ok: boolean;
  /** pass / fail / error (nothing evaluated, or a policy could not be). */
  status?: "pass" | "fail" | "error";
  message?: string;
  platform: string;
  package_id: string;
  warnings: string[];
  failures: (PolicyRef & { message: unknown })[];
  errors?: (PolicyRef & { error: string })[];
  skipped?: (PolicyRef & { reason: string })[];
  /** Every selected policy with its own status; "skipped" ones do not decide the result. */
  policies?: (PolicyRef & { status: "pass" | "fail" | "error" | "skipped" })[];
  evaluated: number;
  org_config?: Record<string, unknown>;
};

/** CLI exit codes: 0 pass, 1 policy failure, 2 error (including a check that evaluated nothing). */
export const EXIT_PASS = 0;
export const EXIT_FAIL = 1;
export const EXIT_ERROR = 2;

export function checkStatus(result: CheckResult): "pass" | "fail" | "error" {
  if (result.status) return result.status;
  // An API without `status`: zero evaluated is never a pass.
  if (!result.evaluated) return "error";
  return result.ok ? "pass" : "fail";
}

export function exitCodeFor(result: CheckResult): number {
  const status = checkStatus(result);
  return status === "pass" ? EXIT_PASS : status === "fail" ? EXIT_FAIL : EXIT_ERROR;
}

/** Upload plan to hosted API — Rego/OPA run on the server. */
export async function runRemoteCheck(
  apiUrl: string,
  orgId: string,
  apiKey: string,
  body: {
    package_id: string;
    plan: Record<string, unknown>;
    platform?: string;
    strict_versions?: boolean;
  }
): Promise<CheckResult> {
  const headers: Record<string, string> = {
    Accept: "application/json",
    Authorization: `Bearer ${apiKey}`,
    "Content-Type": "application/json",
  };
  const res = await fetch(`${apiUrl.replace(/\/$/, "")}/v1/orgs/${orgId}/checks`, {
    method: "POST",
    headers,
    body: JSON.stringify(body),
  });
  const text = await res.text();
  let data: CheckResult & { error?: string };
  try {
    data = JSON.parse(text) as CheckResult & { error?: string };
  } catch {
    throw new Error(`POST /checks → ${res.status}: ${text}`);
  }
  if (res.status === 200 || res.status === 422) return data;
  throw new Error(data.error || `POST /checks → ${res.status}: ${text}`);
}
