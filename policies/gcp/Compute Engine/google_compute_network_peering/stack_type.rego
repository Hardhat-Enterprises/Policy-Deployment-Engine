package terraform.gcp.security.compute_engine.google_compute_network_peering.stack_type

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_peering.vars

conditions := [
    [
        {
            "situation_description": "Network peering is not restricted to IPv4-only, which may introduce IPv6 traffic that is not monitored or secured.",
            "remedies": ["Set stack_type to IPV4_ONLY unless IPv6 is explicitly required and monitoring is in place."]
        },
        {
            "condition": "stack_type should be IPV4_ONLY to avoid unmonitored IPv6 traffic.",
            "attribute_path": ["stack_type"],
            "values": ["IPV4_ONLY"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details