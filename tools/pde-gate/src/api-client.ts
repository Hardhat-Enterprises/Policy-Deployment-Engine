import type { PolicyPackage } from "./plugins/types.js";

async function api<T>(
  apiUrl: string,
  apiKey: string | null,
  method: string,
  path: string,
  body?: unknown
): Promise<T> {
  const headers: Record<string, string> = { Accept: "application/json" };
  if (apiKey) headers.Authorization = `Bearer ${apiKey}`;
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
): Promise<{ org_id: string; api_key: string }> {
  return api(apiUrl, null, "POST", "/v1/orgs/register", input);
}

export async function loginOrg(
  apiUrl: string,
  input: { email: string; password?: string }
): Promise<{ org_id: string; api_key: string }> {
  return api(apiUrl, null, "POST", "/v1/orgs/login", input);
}

export async function getOrg(
  apiUrl: string,
  orgId: string,
  apiKey: string
): Promise<{ org_id: string; org_name: string }> {
  return api(apiUrl, apiKey, "GET", `/v1/orgs/${orgId}`);
}

export async function listPackages(
  apiUrl: string,
  orgId: string,
  apiKey: string
): Promise<PolicyPackage[]> {
  const data = await api<{ packages: PolicyPackage[] }>(
    apiUrl,
    apiKey,
    "GET",
    `/v1/orgs/${orgId}/packages`
  );
  return data.packages;
}

export async function getPackage(
  apiUrl: string,
  orgId: string,
  apiKey: string,
  packageId: string
): Promise<PolicyPackage> {
  return api(apiUrl, apiKey, "GET", `/v1/orgs/${orgId}/packages/${packageId}`);
}

export async function createPackage(
  apiUrl: string,
  orgId: string,
  apiKey: string,
  body: {
    name: string;
    description?: string;
    platforms?: string[];
    policy_groups?: Record<string, string[]>;
    variables?: Record<string, unknown>;
  }
): Promise<PolicyPackage> {
  return api(apiUrl, apiKey, "POST", `/v1/orgs/${orgId}/packages`, body);
}

export async function deletePackage(
  apiUrl: string,
  orgId: string,
  apiKey: string,
  packageId: string
): Promise<void> {
  await api(apiUrl, apiKey, "DELETE", `/v1/orgs/${orgId}/packages/${packageId}`);
}

export async function updatePackage(
  apiUrl: string,
  orgId: string,
  apiKey: string,
  packageId: string,
  body: {
    name?: string;
    description?: string;
    platforms?: string[];
    policy_groups?: Record<string, string[]>;
    variables?: Record<string, unknown>;
  }
): Promise<PolicyPackage> {
  return api(apiUrl, apiKey, "PATCH", `/v1/orgs/${orgId}/packages/${packageId}`, body);
}

export type CheckResult = {
  ok: boolean;
  platform: string;
  package_id: string;
  warnings: string[];
  failures: { policy: string; message: unknown }[];
  evaluated: number;
  org_config?: Record<string, unknown>;
};

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
