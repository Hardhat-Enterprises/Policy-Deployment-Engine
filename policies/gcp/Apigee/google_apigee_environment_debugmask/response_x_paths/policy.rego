package terraform.gcp.security.apigee.google_apigee_environment_debugmask.response_x_paths

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_environment_debugmask.vars

conditions := [
    [
        {
            "situation_description": "The Apigee environment debug mask does not configure any XPath expressions for masking sensitive XML response data.",
            "remedies": [
                "Add sensitive XML response fields to response_x_paths.",
                "Use XPath expressions that match the API response structure.",
                "Include tokens, personal information, payment information, and other sensitive XML fields identified for the API."
            ]
        },
        {
            "condition": "Check whether response_x_paths contains at least one XML response masking path.",
            "attribute_path": [
                "response_x_paths"
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
