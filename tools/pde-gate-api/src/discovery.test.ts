/** Discovery against the real policies/ tree, and the org-value substitution. No DB, no OPA. */
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import test from "node:test";
import { policiesRoot } from "./engine/evaluate.js";
import { substituteOrgValues } from "./engine/opa.js";
import {
  discoverPolicies,
  loadPolicyCatalog,
  policyGroupProblems,
} from "./engine/policy-select.js";

const root = policiesRoot();

test("discovery: google_redis_instance has its 9 argument policies", () => {
  const { targets, warnings } = discoverPolicies(root, "gcp", ["google_redis_instance"], {});
  assert.deepEqual(
    targets.map((t) => t.argument),
    [
      "auth_enabled",
      "connect_mode",
      "customer_managed_key",
      "deletion_policy",
      "deletion_protection",
      "location_id",
      "redis_configs",
      "region",
      "transit_encryption_mode",
    ]
  );
  assert.deepEqual(warnings, []);
  const region = targets.find((t) => t.argument === "region")!;
  assert.equal(region.packageName, "terraform.gcp.security.memorystore_redis.google_redis_instance.region");
  assert.equal(path.basename(region.policyFile), "policy.rego");
  assert.equal(region.varsFile, path.join(path.dirname(path.dirname(region.policyFile)), "_vars.rego"));
});

test("discovery: policy_groups narrows google_vpc_access_connector to exactly the named two", () => {
  const { targets } = discoverPolicies(root, "gcp", ["google_vpc_access_connector"], {
    google_vpc_access_connector: ["region", "ip_cidr_range"],
  });
  assert.deepEqual(targets.map((t) => t.argument).sort(), ["ip_cidr_range", "region"]);
});

test("discovery: a dotted argument folder is found, its package read from the file", () => {
  const { targets } = discoverPolicies(root, "gcp", ["google_storage_batch_operations_job"], {
    google_storage_batch_operations_job: ["rewrite_object.kms_key"],
  });
  assert.equal(targets.length, 1);
  assert.equal(targets[0]!.argument, "rewrite_object.kms_key");
  assert.match(targets[0]!.packageName, /\.google_storage_batch_operations_job\.rewrite_object_kms_key$/);
  assert.ok(fs.existsSync(targets[0]!.policyFile));
});

test("discovery: the whole gcp catalogue", () => {
  const catalog = loadPolicyCatalog(root, "gcp");
  const policies = [...catalog.values()].reduce((n, list) => n + list.length, 0);
  assert.ok(catalog.size > 400, `resource types: ${catalog.size}`);
  assert.ok(policies > 1800, `policies: ${policies}`);
});

test("discovery: unknown resource types become warnings, not targets", () => {
  const { targets, warnings } = discoverPolicies(root, "gcp", ["google_not_a_thing"], {});
  assert.equal(targets.length, 0);
  assert.deepEqual(warnings, ["no PDE policies for resource type google_not_a_thing"]);
});

test("policy_groups: unknown and malformed names are reported, never used as paths", () => {
  const catalog = loadPolicyCatalog(root, "gcp");
  const problems = policyGroupProblems(
    {
      google_redis_instance: ["region", "nope", "../../etc", "a..b", "Region"],
      google_not_a_thing: ["region"],
      "../x": ["region"],
      google_vpc_access_connector: "region",
    },
    catalog
  );
  assert.deepEqual(problems, [
    "policy_groups.google_redis_instance: unknown argument nope",
    'policy_groups.google_redis_instance: invalid argument name "../../etc"',
    'policy_groups.google_redis_instance: invalid argument name "a..b"',
    'policy_groups.google_redis_instance: invalid argument name "Region"',
    "policy_groups: unknown resource type google_not_a_thing",
    'policy_groups: invalid resource type name "../x"',
    "policy_groups.google_vpc_access_connector must be an array of argument names",
  ]);
  assert.deepEqual(policyGroupProblems([], catalog), [
    "policy_groups must be an object of resource_type -> argument names",
  ]);
  assert.deepEqual(policyGroupProblems({ google_redis_instance: ["region"] }, catalog), []);

  // On a check, a bad entry narrows nothing and is a warning.
  const { targets, warnings } = discoverPolicies(root, "gcp", ["google_redis_instance"], {
    google_redis_instance: ["../../etc"],
  });
  assert.equal(targets.length, 9);
  assert.ok(warnings.some((w) => w.includes('"../../etc"')));
});

const REGION_POLICY = `conditions := [[
  {"situation_description": "x", "remedies": ["y"]},
  {
    "condition": "region must be approved",
    "attribute_path": ["region"],
    "values": ["australia-southeast1", "australia-southeast2"],
    "policy_type": "whitelist"
  }
]]`;

test("substitution: approved_regions replaces a region whitelist", () => {
  const { text, warnings } = substituteOrgValues(REGION_POLICY, { approved_regions: ["us-central1"] });
  assert.match(text, /"values": \["us-central1"\]/);
  assert.deepEqual(warnings, []);
});

test("substitution: absent or empty approved_regions keeps the policy's values", () => {
  assert.equal(substituteOrgValues(REGION_POLICY, {}).text, REGION_POLICY);
  assert.equal(substituteOrgValues(REGION_POLICY, { approved_regions: [] }).text, REGION_POLICY);
});

test("substitution: replacement text is literal ($ patterns are not expanded)", () => {
  const { text } = substituteOrgValues(REGION_POLICY, { approved_regions: ["$&", "$1"] });
  assert.match(text, /"values": \["\$&","\$1"\]/);
});

test("substitution: blacklists and other attributes are left alone", () => {
  const blacklist = REGION_POLICY.replace('"whitelist"', '"blacklist"');
  assert.equal(substituteOrgValues(blacklist, { approved_regions: ["us-central1"] }).text, blacklist);
  const other = REGION_POLICY.replace('["region"]', '["network"]');
  assert.equal(substituteOrgValues(other, { approved_regions: ["us-central1"] }).text, other);
});

test("substitution: location keeps the policy's case (google_storage_bucket is upper case)", () => {
  const file = path.join(root, "gcp/Cloud Storage/google_storage_bucket/location/policy.rego");
  const original = fs.readFileSync(file, "utf8");
  assert.match(original, /"AUSTRALIA-SOUTHEAST1"/);
  const { text } = substituteOrgValues(original, { approved_regions: ["europe-west1"] });
  assert.match(text, /"values" : \["EUROPE-WEST1"\]/);

  const lower = REGION_POLICY.replace('["region"]', '["location"]');
  assert.match(
    substituteOrgValues(lower, { approved_regions: ["EUROPE-WEST1"] }).text,
    /"values": \["europe-west1"\]/
  );
});

test("substitution: location values that are not regions are kept, with a warning", () => {
  const global = REGION_POLICY.replace('["region"]', '["location"]').replace(
    '"australia-southeast1", "australia-southeast2"',
    '"global"'
  );
  const { text, warnings } = substituteOrgValues(global, { approved_regions: ["us-central1"] });
  assert.equal(text, global);
  assert.equal(warnings.length, 1);
  assert.match(warnings[0]!, /\["global"\] are not approved_regions names/);
});

test("substitution: zones use approved_zones, any key order", () => {
  const zone = `{
      "attribute_path": ["zone"],
      "policy_type": "whitelist",
      "values": ["australia-southeast1-a"]
    }`;
  const { text } = substituteOrgValues(zone, {
    approved_regions: ["us-central1"],
    approved_zones: ["us-central1-a", "us-central1-b"],
  });
  assert.match(text, /"values": \["us-central1-a","us-central1-b"\]/);
});
