package terraform.gcp.security.firebase.app_check.app_attest.app_id

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase.app_check.app_attest.vars

# Scenario: Only allow specific app_ids (whitelist)
conditions := [
    [
        {
            "situation_description": "Firebase App Check App Attest app_id is not in the approved whitelist.",
            "remedies": [
                "Set app_id to one of the approved app IDs."
            ]
        },
        {
            "condition": "Check if app_id is in the approved whitelist",
            "attribute_path": ["app_id"],
            "values": [
                "projects/my-project-id/apps/1:1234567890:ios:abcdef123456",
                "projects/my-project-id/apps/1:0987654321:ios:fedcba654321"
            ],
            "policy_type": "whitelist"
        }
    ]
]

# General compliance summary message
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance report per resource
details := helpers.get_multi_summary(conditions, vars.variables).details
