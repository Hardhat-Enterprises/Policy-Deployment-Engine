/** The portal's policy catalogue, on the real policies/ tree. No DB, no OPA. */
import assert from "node:assert/strict";
import os from "node:os";
import path from "node:path";
import test from "node:test";
import { policiesRoot } from "./engine/evaluate.js";
import { buildPolicyCatalog } from "./engine/policy-catalog.js";
import { loadPolicyCatalog, policyGroupProblems } from "./engine/policy-select.js";

test("policy catalog: the whole gcp tree, argument names per resource type", () => {
  const resources = buildPolicyCatalog(policiesRoot(), "gcp");
  const policyCount = resources.reduce((n, r) => n + r.policies.length, 0);
  assert.ok(resources.length > 400, `resource_count ${resources.length}`);
  assert.ok(policyCount > 1800, `policy_count ${policyCount}`);

  const redis = resources.find((r) => r.resource_type === "google_redis_instance");
  assert.deepEqual(redis, {
    service: "Memorystore (Redis)",
    resource_type: "google_redis_instance",
    policies: [
      "auth_enabled",
      "connect_mode",
      "customer_managed_key",
      "deletion_policy",
      "deletion_protection",
      "location_id",
      "redis_configs",
      "region",
      "transit_encryption_mode",
    ],
  });
  // Dotted argument folders are listed by their folder name.
  const batch = resources.find((r) => r.resource_type === "google_storage_batch_operations_job");
  assert.ok(batch?.policies.includes("rewrite_object.kms_key"));
  // Sorted by service, then resource type; no policy file names.
  const sorted = [...resources].sort(
    (a, b) => a.service.localeCompare(b.service) || a.resource_type.localeCompare(b.resource_type)
  );
  assert.deepEqual(resources, sorted);
  assert.ok(resources.every((r) => r.policies.every((p) => !p.endsWith(".rego"))));
});

test("policy catalog: everything it lists is a valid policy_groups entry", () => {
  const groups = Object.fromEntries(buildPolicyCatalog(policiesRoot(), "gcp").map((r) => [r.resource_type, r.policies]));
  assert.deepEqual(policyGroupProblems(groups, loadPolicyCatalog(policiesRoot(), "gcp")), []);
});

test("policy catalog: a platform with no policies folder is empty", () => {
  assert.deepEqual(buildPolicyCatalog(policiesRoot(), "aws"), []);
  assert.deepEqual(buildPolicyCatalog(path.join(os.tmpdir(), "pde-missing-catalog"), "gcp"), []);
});
