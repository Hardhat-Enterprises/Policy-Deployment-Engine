package terraform.gcp.security.apigee.google_apigee_app_group.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_app_group.vars

conditions := [
    [
        {
            "situation_description": "deletion_policy should prevent deletion",
            "remedies": [
                "Set deletion_policy to PREVENT"
            ]
        },
        {
            "condition": "deletion_policy should be PREVENT",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details