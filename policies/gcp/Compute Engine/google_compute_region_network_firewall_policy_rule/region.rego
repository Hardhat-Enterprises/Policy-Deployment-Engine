package terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_rule.region

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_rule.vars

conditions := [
    [
        {
            "situation_description": "Firewall policy rule is deployed in an unapproved region.",
            "remedies": [
                "Set region to an approved region such as australia-southeast1 or australia-southeast2."
            ]
        },
        {
            "condition": "Check if region is within approved regions",
            "attribute_path": ["region"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
