package terraform.gcp.security.biglake.google_biglake_service.login_management

import data.terraform.gcp.helpers
import data.terraform.gcp.security.biglake.google_biglake_service.vars

conditions := [
    [
    {
        "situation_description" : "Users are not required to use multi-factor authentication for accessing BigLake.",
        "remedies":[
            "Enforce multi-factor authentication for all users accessing BigLake."
        ]
    },
    {
        "condition": "Check that multi-factor authentication (MFA) is enabled for user accounts.",
        "attribute_path" : ["user_accounts", 0, "mfa_enabled"],
        "values" : [
            true
        ],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
