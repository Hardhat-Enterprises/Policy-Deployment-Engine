package terraform.gcp.security.firebase.web_app.auth_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase.web_app.vars

conditions := [
    [
        {
            "situation_description": "Firebase Web App does not have deletion protection enabled.",
            "remedies": ["Set deletion_policy to ABANDON to prevent accidental deletion."]
        },
        {
            "condition": "Check if deletion_policy is ABANDON",
            "attribute_path": ["values", "deletion_policy"],
            "values": ["ABANDON"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details