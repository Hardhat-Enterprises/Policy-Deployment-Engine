import assert from "node:assert/strict";
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import test from "node:test";
import { fileURLToPath } from "node:url";
import { isPolicyFailure } from "./opa.js";
import { discoverPolicies, readRegoPackage } from "./policy-select.js";
import { gcpCanonicalizer } from "./plugins/gcp/canonicalizer.js";
import { resolvePlatform } from "./plugins/index.js";
import { exitCodeFor } from "./api-client.js";
import { resolveAuth, resolveSession, saveCredentials } from "./credentials.js";

const repoPolicies = path.resolve(
  path.dirname(fileURLToPath(import.meta.url)),
  "../../../policies"
);

test("isPolicyFailure: all passed", () => {
  assert.equal(
    isPolicyFailure([
      "Total: 1",
      ["Situation 1", "Non-Compliant Resources: None - All passed"],
    ]),
    false
  );
});

test("isPolicyFailure: mixed situations — one fail wins", () => {
  assert.equal(
    isPolicyFailure([
      "Total: 2",
      ["S1", "Non-Compliant Resources: bad-region-connector"],
      ["S2", "Non-Compliant Resources: None - All passed"],
    ]),
    true
  );
});

test("isPolicyFailure: empty / null", () => {
  assert.equal(isPolicyFailure(null), false);
  assert.equal(isPolicyFailure([]), false);
});

test("discoverPolicies: policy_groups narrows to the named argument folders", () => {
  const { targets } = discoverPolicies(repoPolicies, "gcp", ["google_vpc_access_connector"], {
    google_vpc_access_connector: ["region", "ip_cidr_range"],
  });
  assert.deepEqual(targets.map((t) => t.argument).sort(), ["ip_cidr_range", "region"]);
  for (const t of targets) {
    assert.equal(path.basename(t.policyFile), "policy.rego");
    assert.equal(path.basename(path.dirname(t.policyFile)), t.argument);
  }
});

test("discoverPolicies: google_redis_instance has 9 argument policies", () => {
  const { targets } = discoverPolicies(repoPolicies, "gcp", ["google_redis_instance"], {});
  assert.equal(targets.length, 9);
});

test("discoverPolicies: dotted argument folder, package read from the file", () => {
  const { targets } = discoverPolicies(repoPolicies, "gcp", ["google_storage_batch_operations_job"], {
    google_storage_batch_operations_job: ["delete_object.permanent_object_deletion_enabled"],
  });
  assert.equal(targets.length, 1);
  assert.match(targets[0]!.packageName, /\.delete_object_permanent_object_deletion_enabled$/);
});

test("discoverPolicies: missing platform root throws", () => {
  assert.throws(() => discoverPolicies(os.tmpdir(), "nope-platform", ["x"], {}));
});

test("readRegoPackage reads package line", () => {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "pde-rego-"));
  const file = path.join(dir, "policy.rego");
  fs.writeFileSync(file, "package foo.bar.baz # comment\n\nmessage := 1\n");
  assert.equal(readRegoPackage(file), "foo.bar.baz");
  fs.rmSync(dir, { recursive: true, force: true });
});

test("shared engine files are identical to the API's copies", () => {
  const here = path.dirname(fileURLToPath(import.meta.url));
  for (const name of ["policy-select.ts", "opa.ts"]) {
    assert.equal(
      fs.readFileSync(path.join(here, name), "utf8"),
      fs.readFileSync(path.join(here, "../../pde-gate-api/src/engine", name), "utf8"),
      `${name} drifted from tools/pde-gate-api/src/engine/${name}`
    );
  }
});

test("exit codes: 0 pass, 1 policy failure, 2 error — zero evaluated is never a pass", () => {
  const base = { platform: "gcp", package_id: "p", warnings: [], failures: [] };
  assert.equal(exitCodeFor({ ...base, ok: true, status: "pass", evaluated: 3 }), 0);
  assert.equal(exitCodeFor({ ...base, ok: false, status: "fail", evaluated: 3 }), 1);
  assert.equal(exitCodeFor({ ...base, ok: false, status: "error", evaluated: 0 }), 2);
  // An older API with no `status` field
  assert.equal(exitCodeFor({ ...base, ok: true, evaluated: 0 }), 2);
  assert.equal(exitCodeFor({ ...base, ok: false, evaluated: 2 }), 1);
});

test("credentials: checks use the API key, management the unexpired session", () => {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "pde-gate-creds-"));
  const saved = { ...process.env };
  try {
    for (const k of ["PDE_ORG_ID", "PDE_API_KEY", "PDE_ORG_TOKEN", "PDE_SESSION_TOKEN", "PDE_API_URL"]) {
      delete process.env[k];
    }
    process.env.PDE_CREDENTIALS_FILE = path.join(dir, "credentials.json");
    const future = new Date(Date.now() + 3600_000).toISOString();
    saveCredentials({ org_id: "org_a", api_key: "pde_k", session_token: "pds.x.y", session_expires_at: future });
    assert.equal(resolveAuth().api_key, "pde_k");
    assert.equal(resolveSession().session_token, "pds.x.y");

    saveCredentials({ org_id: "org_a", api_key: "pde_k", session_token: "pds.x.y", session_expires_at: new Date(0).toISOString() });
    assert.throws(() => resolveSession(), /Session expired.*pde-gate login/);
    assert.equal(resolveAuth().api_key, "pde_k");

    saveCredentials({ org_id: "org_a", session_token: "pds.x.y", session_expires_at: future });
    assert.throws(() => resolveAuth(), /PDE_API_KEY/);
  } finally {
    process.env = saved;
    fs.rmSync(dir, { recursive: true, force: true });
  }
});

test("canonicalizer: strict rejects unsupported terraform version", () => {
  assert.throws(() =>
    gcpCanonicalizer.canonicalize(
      {
        terraform_version: "0.12.0",
        format_version: "1.2",
        planned_values: { root_module: { resources: [] } },
      },
      { strict: true, googleProviderVersion: "7.37.0" }
    )
  );
});

test("canonicalizer: strict rejects missing google provider version", () => {
  assert.throws(
    () =>
      gcpCanonicalizer.canonicalize(
        {
          terraform_version: "1.9.0",
          format_version: "1.2",
          planned_values: { root_module: { resources: [] } },
        },
        { strict: true }
      ),
    /Google provider version not found/
  );
});

test("canonicalizer: strict rejects unsupported google provider", () => {
  assert.throws(
    () =>
      gcpCanonicalizer.canonicalize(
        {
          terraform_version: "1.9.0",
          format_version: "1.2",
          planned_values: { root_module: { resources: [] } },
        },
        { strict: true, googleProviderVersion: "6.0.0" }
      ),
    /Unsupported Google provider/
  );
});

test("canonicalizer: strict accepts supported versions via package fallback", () => {
  const { warnings, plan } = gcpCanonicalizer.canonicalize(
    {
      terraform_version: "1.9.0",
      format_version: "1.2",
      planned_values: { root_module: { resources: [] } },
    },
    { strict: true, googleProviderVersion: "7.37.0" }
  );
  assert.equal(warnings.length, 0);
  assert.equal(plan.google_provider_version, "7.37.0");
});

test("canonicalizer: non-strict warns on unsupported version", () => {
  const { warnings } = gcpCanonicalizer.canonicalize({
    terraform_version: "0.12.0",
    format_version: "1.2",
    planned_values: { root_module: { resources: [] } },
  });
  assert.ok(warnings.some((w) => w.includes("Unsupported terraform_version")));
  assert.ok(warnings.some((w) => w.includes("Google provider version not found")));
});

test("resolvePlatform: explicit aws stays aws even if plan is gcp", () => {
  assert.equal(
    resolvePlatform(
      { planned_values: { root_module: { resources: [{ type: "google_x" }] } } },
      "aws"
    ),
    "aws"
  );
});
