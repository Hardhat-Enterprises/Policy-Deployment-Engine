package terraform.gcp.security.application_integration.google_integrations_auth_config.visibility

import data.terraform.gcp.helpers
import data.terraform.gcp.security.application_integration.google_integrations_auth_config.vars

conditions := [
    [
        {
            "situation_description": "Auth config visibility is set to a non-private value, exposing the config unnecessarily",
            "remedies": [
                "Set visibility to 'PRIVATE' to restrict exposure",
                "Review and limit visibility to authorized principals only"
            ]
        },
        {
            "condition": "Visibility must be 'PRIVATE'",
            "attribute_path": ["visibility"],
            "values": ["PRIVATE"],
            "policy_type": "whitelist"
        }
    ]
]

# Summary message of policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance summary for debugging
details := helpers.get_multi_summary(conditions, vars.variables).details
