package terraform.gcp.security.security_posture.google_securityposture_posture.location

import data.terraform.helpers
import data.terraform.gcp.security.security_posture.google_securityposture_posture.vars

conditions := [
    [
        {
            "situation_description": "The posture is created in a region outside the approved Australian regions.",
            "remedies": [
                "Set location to australia-southeast1 or australia-southeast2."
            ]
        },
        {
            "condition": "location must be an approved Australian region",
            "attribute_path": ["location"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
