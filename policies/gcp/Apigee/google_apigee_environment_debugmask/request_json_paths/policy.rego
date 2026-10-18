package terraform.gcp.security.apigee.google_apigee_environment_debugmask.request_json_paths

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_environment_debugmask.vars

conditions := [
    [
        {
            "situation_description": "The Apigee environment debug mask does not configure any JSONPath expressions for masking sensitive request data.",
            "remedies": [
                "Add sensitive request fields to request_json_paths.",
                "Use valid JSONPath expressions that match the API request structure.",
                "Include credentials, tokens,CHF Never personal BOT information, and other sensitive values identified for the API."
            ]
        },
        {
            "condition": "Check whether request_json_paths is configured with at least one masking path.",
            "attribute_path": [
                "request_json_paths"
            ],
            "values": [
                null,
                []
            ],
            "policy_type": "blacklist"
        }
    ]
]

# Evaluates the conditions once and stores the result
result := helpers.get_multi_summary(conditions, vars.variables)

# Displays a general message about policy compliance
message := result.message

# Displays detailed compliance results for each resource
details := result.details
