/** Request validation and API-key hashing. No DB. */
import assert from "node:assert/strict";
import test from "node:test";
import { HttpError } from "./http-error.js";
import { apiKeyMatches, hashApiKey } from "./store.js";
import { packageBody } from "./validate.js";

function rejects400(fn: () => unknown, pattern: RegExp) {
  assert.throws(fn, (err: unknown) => err instanceof HttpError && err.status === 400 && pattern.test(err.message));
}

test("package body: a valid create passes through", () => {
  const body = packageBody(
    {
      name: " baseline ",
      platforms: ["gcp"],
      policy_groups: { google_vpc_access_connector: ["region", "ip_cidr_range"] },
      variables: { approved_regions: ["australia-southeast1"], google_provider_version: "7.37.0" },
    },
    { partial: false }
  );
  assert.equal(body.name, "baseline");
  assert.deepEqual(body.policy_groups, { google_vpc_access_connector: ["region", "ip_cidr_range"] });
});

test("package body: unknown resource types and arguments are 400s", () => {
  rejects400(
    () => packageBody({ name: "p", policy_groups: { google_vpc_access_connector: ["network"] } }, { partial: false }),
    /unknown argument network/
  );
  rejects400(
    () => packageBody({ name: "p", policy_groups: { google_not_a_thing: ["region"] } }, { partial: false }),
    /unknown resource type google_not_a_thing/
  );
  rejects400(
    () => packageBody({ policy_groups: { google_redis_instance: ["../region"] } }, { partial: true }),
    /invalid argument name/
  );
});

test("package body: field types are checked", () => {
  rejects400(() => packageBody({}, { partial: false }), /name is required/);
  rejects400(() => packageBody({ name: 1 }, { partial: false }), /name is required/);
  rejects400(() => packageBody({ name: "p", platforms: ["gcp", "mainframe"] }, { partial: false }), /platforms/);
  rejects400(() => packageBody({ name: "p", variables: [] }, { partial: false }), /variables must be an object/);
  rejects400(
    () => packageBody({ name: "p", variables: { approved_regions: "us-central1" } }, { partial: false }),
    /approved_regions must be an array/
  );
  rejects400(() => packageBody("nope", { partial: true }), /JSON object/);
  // A PATCH may leave the name out.
  assert.deepEqual(packageBody({ description: "x" }, { partial: true }), { description: "x" });
});

test("package body: approved_regions and approved_zones must be GCP names", () => {
  const vars = (variables: Record<string, unknown>) => () =>
    packageBody({ name: "p", variables }, { partial: false });
  rejects400(vars({ approved_regions: ["us-east-1"] }), /approved_regions: \["us-east-1"\] is not a GCP name/);
  rejects400(vars({ approved_regions: ["US-CENTRAL1"] }), /approved_regions/);
  rejects400(vars({ approved_regions: ["global"] }), /approved_regions/);
  rejects400(vars({ approved_regions: ["us-central1", "$&"] }), /approved_regions: \["\$&"\]/);
  rejects400(vars({ approved_zones: ["us-east-1a"] }), /approved_zones: \["us-east-1a"\]/);
  rejects400(vars({ approved_zones: ["us-central1"] }), /approved_zones/);
  rejects400(
    () => packageBody({ variables: { approved_zones: ["us-central1-a", "eu"] } }, { partial: true }),
    /approved_zones: \["eu"\]/
  );
  assert.deepEqual(
    packageBody(
      { variables: { approved_regions: ["us-central1", "us-east1"], approved_zones: ["us-central1-a"] } },
      { partial: true }
    ).variables,
    { approved_regions: ["us-central1", "us-east1"], approved_zones: ["us-central1-a"] }
  );
});

test("api keys: stored as sha256, compared in constant time", () => {
  const key = "pde_0123456789abcdef";
  const stored = hashApiKey(key);
  assert.match(stored, /^[0-9a-f]{64}$/);
  assert.notEqual(stored, key);
  assert.equal(apiKeyMatches(key, stored), true);
  assert.equal(apiKeyMatches("pde_wrong", stored), false);
  assert.equal(apiKeyMatches(key, "not-a-hash"), false);
});
