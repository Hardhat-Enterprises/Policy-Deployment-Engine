/** The evaluation core, without the database. The OPA cases skip when `opa` is not on PATH. */
import assert from "node:assert/strict";
import { spawnSync } from "node:child_process";
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import test from "node:test";
import { evaluateCheck, policiesRoot, type CheckPackage } from "./engine/evaluate.js";

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

// ---------------------------------------------------------------------------
// End to end through OPA, on the committed fixture plan of the redis region policy.
// ---------------------------------------------------------------------------
const regionDir = path.join(policiesRoot(), "gcp/Memorystore (Redis)/google_redis_instance/region");

function committedPlan(): Record<string, unknown> {
  const name = fs.readdirSync(regionDir).find((f) => /^[0-9a-f]{64}\.json$/.test(f));
  assert.ok(name, "committed <sha>.json plan");
  return JSON.parse(fs.readFileSync(path.join(regionDir, name), "utf8"));
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

test("opa: a content-security policy is skipped and the check is an error", { skip: !hasOpa }, async () => {
  const result = await evaluateCheck({
    pkg: pkg({ policy_groups: { google_ces_agent: ["after_agent_callbacks.python_code"] } }),
    plan: planWith([{ type: "google_ces_agent", name: "a", values: {} }]),
  });
  assert.equal(result.status, "error");
  assert.equal(result.ok, false);
  assert.equal(result.skipped.length, 1);
  assert.match(result.skipped[0]!.reason, /Bandit/);
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
