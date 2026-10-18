package terraform.gcp.security.compute_engine.google_compute_subnetwork.ipv6_access_type

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_subnetwork.vars

conditions := [[
    {
        "situation_description": "The subnetwork uses external IPv6 addresses",
        "remedies": ["Set ipv6_access_type to INTERNAL"]
    },
    {
        "condition": "IPv6 access must be internal",
        "attribute_path": ["ipv6_access_type"],
        "values": ["INTERNAL"],
        "policy_type": "whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
