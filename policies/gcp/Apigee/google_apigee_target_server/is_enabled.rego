package terraform.gcp.security.apigee.google_apigee_target_server.is_enabled

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_target_server.vars

conditions := [
    [
        {
            "situation_description": "The Apigee target server is disabled, which could prevent API requests from reaching the configured backend service.",
            "remedies": [
                "Set is_enabled to true.",
                "Confirm that the target server is available before enabling API traffic."
            ]
        },
        {
            "condition": "Check whether is_enabled is set to true.",
            "attribute_path": ["is_enabled"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays detailed compliance results for each resource
details := helpers.get_multi_summary(conditions, vars.variables).details
