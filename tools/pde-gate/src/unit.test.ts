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

test("discoverPolicies: filters by policy_groups basenames", () => {
  const targets = discoverPolicies(
    repoPolicies,
    "gcp",
    new Set(["google_vpc_access_connector"]),
    { google_vpc_access_connector: ["region", "ip_cidr_range"] }
  );
  assert.equal(targets.length, 1);
  const names = targets[0]!.policyFiles.map((f) => path.basename(f, ".rego")).sort();
  assert.deepEqual(names, ["ip_cidr_range", "region"]);
});

test("discoverPolicies: missing platform root throws", () => {
  assert.throws(() =>
    discoverPolicies(os.tmpdir(), "nope-platform", new Set(["x"]), {})
  );
});

test("readRegoPackage reads package line", () => {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "pde-rego-"));
  const file = path.join(dir, "x.rego");
  fs.writeFileSync(file, "package foo.bar.baz\n\nmessage := 1\n");
  assert.equal(readRegoPackage(file), "foo.bar.baz");
  fs.rmSync(dir, { recursive: true, force: true });
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
