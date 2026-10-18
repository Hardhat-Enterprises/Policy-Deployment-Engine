package terraform.gcp.security.compute_engine.google_compute_region_security_policy.rules_action

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy.vars

conditions := [
    [
        {
            "situation_description": "The security policy allows matching network traffic.",
            "remedies": [
                "Use a deny action such as 'deny(403)' to block unwanted traffic."
            ]
        },
        {
            "condition": "Rule action must deny matching traffic",
            "attribute_path": ["rules", 0, "action"],
            "values": ["deny(403)"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details