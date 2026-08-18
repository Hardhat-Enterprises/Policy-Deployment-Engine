package terraform.gcp.security.apigee.google_apigee_environment_debugmask.response_json_paths

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_environment_debugmask.vars

conditions := [
    [
        {
            "situation_description": "The Apigee environment debug mask does not use approved JSONPath expressions to mask sensitive data in response-message debug output.",
            "remedies": [
                "Add approved sensitive response fields to response_json_paths.",
                "Ensure that each JSONPath expression matches the API response structure.",
                "Review response payloads for access tokens, personal information, payment information, and other sensitive values."
            ]
        },
        {
            "condition": "Check whether response_json_paths contains only approved JSONPath expressions.",
            "attribute_path": [
                "response_json_paths"
            ],
            "values": [
                "$.accessToken",
                "$.customer.email"
            ],
            "policy_type": "whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays detailed compliance results for each resource
details := helpers.get_multi_summary(conditions, vars.variables).details
