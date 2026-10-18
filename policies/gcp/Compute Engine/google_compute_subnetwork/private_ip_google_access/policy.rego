package terraform.gcp.security.compute_engine.google_compute_subnetwork.private_ip_google_access

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_subnetwork.vars

conditions := [[
    {
        "situation_description": "Private Google Access is disabled for IPv4 workloads",
        "remedies": ["Set private_ip_google_access to true"]
    },
    {
        "condition": "Private Google Access must be enabled",
        "attribute_path": ["private_ip_google_access"],
        "values": [true],
        "policy_type": "whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
