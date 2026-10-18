package terraform.gcp.security.compute_engine.google_compute_subnetwork.allow_subnet_cidr_routes_overlap

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_subnetwork.vars

conditions := [[
    {
        "situation_description": "Subnetwork CIDR routes are allowed to overlap dynamic routes",
        "remedies": ["Set allow_subnet_cidr_routes_overlap to false"]
    },
    {
        "condition": "Subnet CIDR route overlap must be disabled",
        "attribute_path": ["allow_subnet_cidr_routes_overlap"],
        "values": [false],
        "policy_type": "whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
