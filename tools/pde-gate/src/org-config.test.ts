import assert from "node:assert/strict";
import { describe, it } from "node:test";
import { mergePlanWithOrgConfig, validateOrgConfig } from "../src/org-config.js";

describe("org-config", () => {
    it("merges approved regions into plan input", () => {
        const plan = { planned_values: { root_module: { resources: [] } } };
        const merged = mergePlanWithOrgConfig(plan, {
            schema_version: "1",
            org_id: "acme",
            org_name: "Acme",
            registered_at: "2026-01-01T00:00:00Z",
            approved_regions: ["europe-west1"],
            approved_zones: ["europe-west1-b"],
            policy_pin: "main",
            contact_email: "ops@acme.example",
        }) as {
            org_config: { approved_regions: string[]; approved_zones: string[] };
        };

        assert.deepEqual(merged.org_config.approved_regions, ["europe-west1"]);
        assert.deepEqual(merged.org_config.approved_zones, ["europe-west1-b"]);
    });

    it("requires approved_regions", () => {
        assert.throws(
            () =>
                validateOrgConfig({
                    org_id: "x",
                    org_name: "X",
                    approved_regions: [],
                }),
            /approved_regions must be a non-empty list/
        );
    });
});
