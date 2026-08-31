import assert from "node:assert/strict";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { describe, it } from "node:test";
import type { PolicyTarget } from "./discover.js";
import { filterPoliciesForOrg, policyBasename, serviceFromPolicy } from "./policy-select.js";

const policiesRoot = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "../../../policies");
const profilesPath = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "../policy-profiles.json");

const samplePolicies: PolicyTarget[] = [
    {
        file: path.join(
            policiesRoot,
            "gcp/Serverless VPC Access/google_vpc_access_connector/region.rego"
        ),
        dir: path.join(policiesRoot, "gcp/Serverless VPC Access/google_vpc_access_connector"),
        packageName: "terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.region",
        resourceType: "google_vpc_access_connector",
    },
    {
        file: path.join(
            policiesRoot,
            "gcp/Serverless VPC Access/google_vpc_access_connector/network.rego"
        ),
        dir: path.join(policiesRoot, "gcp/Serverless VPC Access/google_vpc_access_connector"),
        packageName: "terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.network",
        resourceType: "google_vpc_access_connector",
    },
    {
        file: path.join(
            policiesRoot,
            "gcp/Serverless VPC Access/google_vpc_access_connector/machine_type.rego"
        ),
        dir: path.join(policiesRoot, "gcp/Serverless VPC Access/google_vpc_access_connector"),
        packageName:
            "terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.machine_type",
        resourceType: "google_vpc_access_connector",
    },
];

describe("policy-select", () => {
    it("returns all policies when org config has no selection", () => {
        const filtered = filterPoliciesForOrg(samplePolicies, policiesRoot, null, profilesPath);
        assert.equal(filtered.length, samplePolicies.length);
    });

    it("filters by enabled_policies basenames", () => {
        const filtered = filterPoliciesForOrg(
            samplePolicies,
            policiesRoot,
            {
                schema_version: "1",
                org_id: "acme",
                org_name: "Acme",
                registered_at: "2026-01-01T00:00:00Z",
                approved_regions: ["australia-southeast1"],
                approved_zones: [],
                policy_pin: "main",
                contact_email: "ops@acme.example",
                enabled_policies: {
                    google_vpc_access_connector: ["region"],
                },
            },
            profilesPath
        );
        assert.equal(filtered.length, 1);
        assert.equal(policyBasename(filtered[0]!.file), "region");
    });

    it("loads baseline profile subset", () => {
        const filtered = filterPoliciesForOrg(
            samplePolicies,
            policiesRoot,
            {
                schema_version: "1",
                org_id: "acme",
                org_name: "Acme",
                registered_at: "2026-01-01T00:00:00Z",
                approved_regions: ["australia-southeast1"],
                approved_zones: [],
                policy_pin: "main",
                policy_profile: "baseline",
                contact_email: "ops@acme.example",
            },
            profilesPath
        );
        assert.equal(filtered.length, 2);
        const names = filtered.map((p) => policyBasename(p.file)).sort();
        assert.deepEqual(names, ["network", "region"]);
    });

    it("extracts GCP service folder from policy path", () => {
        assert.equal(
            serviceFromPolicy(samplePolicies[0]!, policiesRoot),
            "Serverless VPC Access"
        );
    });
});
