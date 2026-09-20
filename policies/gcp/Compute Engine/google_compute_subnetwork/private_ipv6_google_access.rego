package terraform.gcp.security.compute_engine.google_compute_subnetwork.private_ipv6_google_access

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_subnetwork.vars

conditions := [[
    {
        "situation_description": "Private Google Access is disabled for IPv6 workloads",
        "remedies": [
            "Set private_ipv6_google_access to ENABLE_OUTBOUND_VM_ACCESS_TO_GOOGLE or ENABLE_BIDIRECTIONAL_ACCESS_TO_GOOGLE"
        ]
    },
    {
        "condition": "Private IPv6 Google Access must be enabled",
        "attribute_path": ["private_ipv6_google_access"],
        "values": [
            "ENABLE_OUTBOUND_VM_ACCESS_TO_GOOGLE",
            "ENABLE_BIDIRECTIONAL_ACCESS_TO_GOOGLE"
        ],
        "policy_type": "whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
