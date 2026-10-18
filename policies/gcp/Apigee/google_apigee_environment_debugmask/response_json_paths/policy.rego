package terraform.gcp.security.apigee.google_apigee_environment_debugmask.response_json_paths

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_environment_debugmask.vars

conditions := [
    [
        {
            "situation_description": "The Apigee environment debug mask does not configure any JSONPath expressions for masking sensitive response data.",
            "remedies": [
                "Add sensitive response fields to response_json_paths.",
                "Use JSONPath expressions that match the API response structure.",
                "Include tokens, personal information, payment information, and other sensitive response fields identified for the API."
            ]
        },
        {
            "condition": "Check whether response_json_paths contains at least one response masking path.",
            "attribute_path": [
                "response_json_paths"
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
