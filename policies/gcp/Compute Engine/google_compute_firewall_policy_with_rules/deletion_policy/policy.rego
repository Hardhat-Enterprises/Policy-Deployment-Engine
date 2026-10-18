package terraform.gcp.security.compute_engine.google_compute_firewall_policy_with_rules.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_firewall_policy_with_rules.vars

conditions := [
    [
        {
            "situation_description": "Firewall policies must be protected from accidental destruction.",
            "remedies": [
                "Set deletion_policy to PREVENT."
            ]
        },
        {
            "condition": "Deletion protection is not enabled.",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details