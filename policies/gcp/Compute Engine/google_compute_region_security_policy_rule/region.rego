package terraform.gcp.security.compute_engine.google_compute_region_security_policy_rule.region

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy_rule.vars

conditions := [
    [
        {
            "situation_description": "The regional security policy rule is deployed outside the organisation's approved regional boundary.",
            "remedies": [
                "Deploy the regional security policy rule in an approved region.",
                "Select a region that satisfies organisational security, governance, and data residency requirements.",
                "Maintain the approved regional baseline through the organisation's infrastructure governance process."
            ]
        },
        {
            "condition": "Require the regional security policy rule to reside within an approved region.",
            "attribute_path": ["region"],
            "values": [
                "australia-southeast1",
                "australia-southeast2"
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
