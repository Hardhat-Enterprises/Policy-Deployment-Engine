import assert from "node:assert/strict";
import test from "node:test";
import { gcpCanonicalizer } from "./plugins/gcp/canonicalizer.js";
import { resolvePlatform } from "./plugins/index.js";

test("gcp canonicalizer flattens child modules", () => {
  const { plan, warnings } = gcpCanonicalizer.canonicalize(
    {
      terraform_version: "1.9.0",
      format_version: "1.2",
      planned_values: {
        root_module: {
          resources: [{ type: "google_compute_instance", name: "a", values: {} }],
          child_modules: [
            {
              resources: [{ type: "google_storage_bucket", name: "b", values: {} }],
            },
          ],
        },
      },
    },
    { googleProviderVersion: "7.37.0" }
  );
  assert.equal(plan.planned_values.root_module.resources.length, 2);
  assert.equal(warnings.length, 0);
});

test("resolvePlatform prefers google_ resources", () => {
  const id = resolvePlatform({
    planned_values: {
      root_module: { resources: [{ type: "google_vpc_access_connector" }] },
    },
  });
  assert.equal(id, "gcp");
});
