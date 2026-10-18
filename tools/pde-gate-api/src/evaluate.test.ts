/** The evaluation core, without the database. The OPA cases skip when `opa` is not on PATH. */
import assert from "node:assert/strict";
import { spawnSync } from "node:child_process";
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import test from "node:test";
import { evaluateCheck, policiesRoot, type CheckPackage } from "./engine/evaluate.js";
import { policyErrorText } from "./engine/opa.js";

const hasOpa = spawnSync("opa", ["version"]).status === 0;

const pkg = (over: Partial<CheckPackage> = {}): CheckPackage => ({
  package_id: "pkg_test",
  platforms: ["gcp"],
  policy_groups: {},
  variables: { google_provider_version: "7.37.0" },
  ...over,
});

const planWith = (resources: unknown[]) => ({
  terraform_version: "1.9.0",
  format_version: "1.2",
  planned_values: { root_module: { resources } },
});

test("zero policies: a plan with only an unknown resource type is an error, not a pass", async () => {
  const result = await evaluateCheck({
    pkg: pkg(),
    plan: planWith([{ type: "google_not_a_thing", name: "x", values: {} }]),
  });
  assert.equal(result.ok, false);
  assert.equal(result.status, "error");
  assert.equal(result.evaluated, 0);
  assert.match(result.message, /nothing was evaluated/);
  assert.ok(result.warnings.includes("no PDE policies for resource type google_not_a_thing"));
});

test("zero policies: a plan with no resources is an error, not a pass", async () => {
  const result = await evaluateCheck({ pkg: pkg(), plan: planWith([]) });
  assert.equal(result.ok, false);
  assert.equal(result.status, "error");
  assert.equal(result.evaluated, 0);
});

test("a package for another platform is rejected", async () => {
  await assert.rejects(
    evaluateCheck({ pkg: pkg({ platforms: ["aws"] }), plan: planWith([{ type: "google_redis_instance" }]) }),
    (err: { status?: number }) => err.status === 400
  );
});

test("policyErrorText: finds the helpers' marker at any depth, from the marker on", () => {
  assert.equal(policyErrorText(["Total X detected: 1 ", ["Situation 1: x", "Non-Compliant Resources: a"]]), null);
  assert.equal(policyErrorText(["POLICY ERROR: bad. Nothing was checked."]), "POLICY ERROR: bad. Nothing was checked.");
  assert.equal(policyErrorText([["x", ["note: POLICY ERROR: deep "]]]), "POLICY ERROR: deep");
  assert.equal(policyErrorText({ message: ["POLICY ERROR: in an object"] }), "POLICY ERROR: in an object");
  assert.equal(policyErrorText(null), null);
});

// ---------------------------------------------------------------------------
// End to end through OPA, on the committed fixture plan of the redis region policy.
// ---------------------------------------------------------------------------
const regionDir = path.join(policiesRoot(), "gcp/Memorystore (Redis)/google_redis_instance/region");

function committedPlan(dir = regionDir): Record<string, unknown> {
  const name = fs.readdirSync(dir).find((f) => /^[0-9a-f]{64}\.json$/.test(f));
  assert.ok(name, "committed <sha>.json plan");
  return JSON.parse(fs.readFileSync(path.join(dir, name), "utf8"));
}

function nonCompliant(message: unknown): string[] {
  const text = JSON.stringify(message);
  return [...text.matchAll(/Non-Compliant Resources: ([^"]*)/g)].flatMap((m) =>
    m[1]!.split(",").map((s) => s.trim())
  );
}

const regionOnly = { google_redis_instance: ["region"] };

test("opa: the region policy fails only non-compliant-example-1", { skip: !hasOpa }, async () => {
  const result = await evaluateCheck({ pkg: pkg({ policy_groups: regionOnly }), plan: committedPlan() });
  assert.equal(result.evaluated, 1);
  assert.equal(result.status, "fail");
  assert.equal(result.ok, false);
  assert.equal(result.failures.length, 1);
  assert.equal(result.failures[0]!.argument, "region");
  assert.deepEqual(nonCompliant(result.failures[0]!.message), ["non-compliant-example-1"]);
});

test("opa: approved_regions [us-central1] replaces the whitelist", { skip: !hasOpa }, async () => {
  const result = await evaluateCheck({
    pkg: pkg({
      policy_groups: regionOnly,
      variables: { google_provider_version: "7.37.0", approved_regions: ["us-central1"] },
    }),
    plan: committedPlan(),
  });
  assert.equal(result.status, "fail");
  // compliant_example_1 is in australia-southeast2, now outside the whitelist;
  // non_compliant_example_1 is in us-central1, now inside it.
  assert.deepEqual(nonCompliant(result.failures[0]!.message), ["compliant-example-1"]);
});

test("opa: with no approved_regions the policy's own values are kept", { skip: !hasOpa }, async () => {
  const result = await evaluateCheck({
    pkg: pkg({ policy_groups: regionOnly, variables: { google_provider_version: "7.37.0", approved_regions: [] } }),
    plan: committedPlan(),
  });
  assert.deepEqual(nonCompliant(result.failures[0]!.message), ["non-compliant-example-1"]);
});

test("opa: only the compliant resource → pass", { skip: !hasOpa }, async () => {
  const plan = committedPlan() as { planned_values: { root_module: { resources: { name: string }[] } } };
  plan.planned_values.root_module.resources = plan.planned_values.root_module.resources.filter(
    (r) => r.name === "compliant_example_1"
  );
  const result = await evaluateCheck({ pkg: pkg({ policy_groups: regionOnly }), plan });
  assert.equal(result.status, "pass");
  assert.equal(result.ok, true);
  assert.equal(result.evaluated, 1);
});

test("opa: all 9 redis policies run on their own data, none errors", { skip: !hasOpa }, async () => {
  const result = await evaluateCheck({ pkg: pkg(), plan: committedPlan() });
  assert.deepEqual(result.errors, []);
  assert.equal(result.evaluated, 9);
});

const cesAgentDir = path.join(policiesRoot(), "gcp/Customer Engagement Suite/google_ces_agent/location");

test("opa: the 6 content-security policies are skipped, the rest decide the result", { skip: !hasOpa }, async () => {
  const result = await evaluateCheck({ pkg: pkg(), plan: committedPlan(cesAgentDir) });
  const skipped = result.policies.filter((p) => p.status === "skipped").map((p) => p.argument);
  assert.deepEqual(skipped.sort(), [
    "after_agent_callbacks.python_code",
    "after_model_callbacks.python_code",
    "after_tool_callbacks.python_code",
    "before_agent_callbacks.python_code",
    "before_model_callbacks.python_code",
    "before_tool_callbacks.python_code",
  ]);
  assert.equal(result.skipped.length, 6);
  for (const argument of skipped) {
    assert.ok(
      result.warnings.some((w) => w.startsWith(`google_ces_agent/${argument}: skipped`)),
      `warning for ${argument}`
    );
  }
  assert.deepEqual(result.errors, []);
  assert.notEqual(result.status, "error");
  assert.equal(result.evaluated, result.policies.length - 6);
  assert.ok(result.evaluated > 0);
  // The location fixture's non-compliant resource still fails its policy.
  assert.equal(result.status, "fail");
  assert.ok(result.failures.some((f) => f.argument === "location"));
});

test("opa: when every selected policy is skipped, nothing was evaluated → error", { skip: !hasOpa }, async () => {
  const result = await evaluateCheck({
    pkg: pkg({ policy_groups: { google_ces_agent: ["after_agent_callbacks.python_code"] } }),
    plan: planWith([{ type: "google_ces_agent", name: "a", values: {} }]),
  });
  assert.equal(result.status, "error");
  assert.equal(result.ok, false);
  assert.equal(result.evaluated, 0);
  assert.deepEqual(result.policies.map((p) => p.status), ["skipped"]);
  assert.match(result.skipped[0]!.reason, /Bandit/);
  assert.match(result.message, /Every selected policy was skipped/);
});

test("opa: a capitalised \"Whitelist\" still takes the org's approved_regions", { skip: !hasOpa }, async () => {
  const dir = path.join(policiesRoot(), "gcp/Compute Engine/google_compute_region_autoscaler/region");
  assert.match(fs.readFileSync(path.join(dir, "policy.rego"), "utf8"), /"policy_type": "Whitelist"/);
  const only = { google_compute_region_autoscaler: ["region"] };
  const own = await evaluateCheck({ pkg: pkg({ policy_groups: only }), plan: committedPlan(dir) });
  assert.deepEqual(nonCompliant(own.failures[0]!.message), ["non_compliant_example_1"]);

  const org = await evaluateCheck({
    pkg: pkg({
      policy_groups: only,
      variables: { google_provider_version: "7.37.0", approved_regions: ["asia-south1"] },
    }),
    plan: committedPlan(dir),
  });
  // compliant_example_1 is in us-central1, non_compliant_example_1 in asia-south1.
  assert.equal(org.status, "fail");
  assert.deepEqual(nonCompliant(org.failures[0]!.message), ["compliant_example_1"]);
});

test("opa: a policy OPA rejects, or with no message rule, is a per-policy error", { skip: !hasOpa }, async () => {
  const tmp = fs.mkdtempSync(path.join(fs.realpathSync(os.tmpdir()), "pde-gate-eval-"));
  try {
    fs.symlinkSync(path.join(policiesRoot(), "_helpers"), path.join(tmp, "_helpers"));
    const resource = path.join(tmp, "gcp", "Test Service", "google_test_thing");
    fs.mkdirSync(path.join(resource, "broken"), { recursive: true });
    fs.mkdirSync(path.join(resource, "silent"), { recursive: true });
    fs.writeFileSync(
      path.join(resource, "_vars.rego"),
      'package terraform.gcp.security.test.google_test_thing.vars\n\nvariables := {"resource_type": "google_test_thing"}\n'
    );
    fs.writeFileSync(
      path.join(resource, "broken", "policy.rego"),
      "package terraform.gcp.security.test.google_test_thing.broken\n\nmessage := [\n"
    );
    fs.writeFileSync(
      path.join(resource, "silent", "policy.rego"),
      "package terraform.gcp.security.test.google_test_thing.silent\n\nother := 1\n"
    );
    const result = await evaluateCheck({
      pkg: pkg(),
      plan: planWith([{ type: "google_test_thing", name: "a", values: {} }]),
      policiesRoot: tmp,
    });
    assert.equal(result.status, "error");
    assert.equal(result.ok, false);
    assert.equal(result.evaluated, 0);
    assert.deepEqual(
      result.errors.map((e) => [e.argument, e.error]),
      [
        ["broken", "OPA evaluation failed"],
        ["silent", "policy message is undefined (package terraform.gcp.security.test.google_test_thing.silent)"],
      ]
    );
  } finally {
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});

test("opa: a policy the helpers refuse (POLICY ERROR) is an error, not a pass", { skip: !hasOpa }, async () => {
  const tmp = fs.mkdtempSync(path.join(fs.realpathSync(os.tmpdir()), "pde-gate-policy-error-"));
  try {
    fs.symlinkSync(path.join(policiesRoot(), "_helpers"), path.join(tmp, "_helpers"));
    const realResource = path.join(policiesRoot(), "gcp/Memorystore (Redis)/google_redis_instance");
    const resource = path.join(tmp, "gcp", "Memorystore (Redis)", "google_redis_instance");
    fs.mkdirSync(path.join(resource, "refused"), { recursive: true });
    fs.mkdirSync(path.join(resource, "region"), { recursive: true });
    fs.copyFileSync(path.join(realResource, "_vars.rego"), path.join(resource, "_vars.rego"));
    // A passing policy beside it, so without the POLICY ERROR handling the check would pass.
    fs.copyFileSync(path.join(realResource, "region", "policy.rego"), path.join(resource, "region", "policy.rego"));
    // policies/_helpers/README.md: an empty "values" on element required refuses the whole policy.
    fs.writeFileSync(
      path.join(resource, "refused", "policy.rego"),
      `package terraform.gcp.security.memorystore_redis.google_redis_instance.refused

import data.terraform.helpers
import data.terraform.gcp.security.memorystore_redis.google_redis_instance.vars

conditions := [[
  {"situation_description": "x", "remedies": ["y"]},
  {"condition": "c", "attribute_path": ["region"], "values": [], "policy_type": "element required"}
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
`
    );
    const result = await evaluateCheck({
      pkg: pkg(),
      plan: planWith([{ type: "google_redis_instance", name: "a", values: { region: "australia-southeast1" } }]),
      policiesRoot: tmp,
    });
    assert.equal(result.status, "error");
    assert.equal(result.ok, false);
    assert.deepEqual(
      result.policies.map((p) => [p.argument, p.status]),
      [
        ["refused", "error"],
        ["region", "pass"],
      ]
    );
    assert.equal(result.evaluated, 1);
    assert.equal(result.errors.length, 1);
    assert.match(result.errors[0]!.error, /^POLICY ERROR: invalid element required values on 'region'\. Nothing in this policy was checked\./);
  } finally {
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});
