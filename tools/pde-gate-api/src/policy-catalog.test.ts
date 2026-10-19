import assert from "node:assert/strict";
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import test from "node:test";
import { buildPolicyCatalog } from "./engine/policy-catalog.js";
import { policiesRoot } from "./engine/run-check.js";

test("policy catalog discovers resources and their argument policies", () => {
  const resources = buildPolicyCatalog(path.join(policiesRoot(), "gcp"));
  const policyCount = resources.reduce((count, resource) => count + resource.policies.length, 0);
  assert.ok(resources.length > 400, `resource_count ${resources.length}`);
  assert.ok(policyCount > 1800, `policy_count ${policyCount}`);
  const connector = resources.find(r => r.resource_type === "google_vpc_access_connector");
  assert.deepEqual(connector, {
    service: "Serverless VPC Access",
    resource_type: "google_vpc_access_connector",
    policies: ["ip_cidr_range", "region"],
  });
});

test("policy catalog returns an empty list for a missing directory", () => {
  assert.deepEqual(buildPolicyCatalog(path.join(os.tmpdir(), "pde-missing-catalog")), []);
});
