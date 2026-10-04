import assert from "node:assert/strict";
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import test from "node:test";
import { buildPolicyCatalog } from "./engine/policy-catalog.js";

test("policy catalog discovers resources and policy filenames", () => {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), "pde-catalog-"));
  const resourceDir = path.join(root, "Serverless VPC Access", "google_vpc_access_connector");
  try {
    fs.mkdirSync(resourceDir, { recursive: true });
    fs.writeFileSync(
      path.join(resourceDir, "_vars.rego"),
      'package vars\nresource_type := "google_vpc_access_connector"\n'
    );
    fs.writeFileSync(path.join(resourceDir, "region.rego"), "package example.region\n");
    fs.writeFileSync(path.join(resourceDir, "network.rego"), "package example.network\n");

    assert.deepEqual(buildPolicyCatalog(root), [{
      service: "Serverless VPC Access",
      resource_type: "google_vpc_access_connector",
      policies: ["network", "region"],
    }]);
  } finally {
    fs.rmSync(root, { recursive: true, force: true });
  }
});

test("policy catalog returns an empty list for a missing directory", () => {
  assert.deepEqual(buildPolicyCatalog(path.join(os.tmpdir(), "pde-missing-catalog")), []);
});
