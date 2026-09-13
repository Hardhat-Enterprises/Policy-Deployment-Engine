package terraform.gcp.security.apigee.google_apigee_environment_debugmask.request_x_paths

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_environment_debugmask.vars

conditions := [
    [
        {
            "situation_description": "The Apigee environment debug mask does not configure any XPath expressions for masking sensitive XML request data.",
            "remedies": [
                "Add sensitive XML request fields to request_x_paths.",
                "Use XPath expressions that match the structure of the API request payload.",
                "Include credentials, tokens, personal information, payment information, and other sensitive fields identified for the API."
            ]
        },
        {
            "condition": "Check whether request_x_paths contains at least one XML masking path.",
            "attribute_path": [
                "request_x_paths"
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
