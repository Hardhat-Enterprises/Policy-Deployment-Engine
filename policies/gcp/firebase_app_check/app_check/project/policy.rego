package terraform.gcp.security.firebase.app_check.app_attest.project

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase.app_check.app_attest.vars

# Scenario: project must match the provider project if set
conditions := [
    [
        {
            "situation_description": "The project must match the provider project or be left unset.",
            "remedies": [
                "Set the project to the same value as the Terraform provider project or leave it unset."
            ]
        },
        {
            "condition": "Check if project matches provider",
            "attribute_path": ["project"],
            "values": ["ankita-firebase-appcheck-id"],
            "policy_type": "whitelist"
        }
    ]
]

# General compliance summary message
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance report per resource
details := helpers.get_multi_summary(conditions, vars.variables).details
