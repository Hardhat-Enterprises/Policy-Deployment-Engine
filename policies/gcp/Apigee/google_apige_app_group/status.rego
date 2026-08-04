package terraform.gcp.security.apigee.google_apigee_app_group.status

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_app_group.vars

conditions := [
    [
        {
            "situation_description": "status should be active",
            "remedies": [
                "Ensure Apigee AppGroup status is set to active"
            ]
        },
        {
            "condition": "status should be active",
            "attribute_path": ["status"],
            "values": ["active"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details