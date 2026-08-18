package terraform.gcp.security.apigee.google_apigee_environment_debugmask.request_json_paths

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_environment_debugmask.vars

conditions := [
    [
        {
            "situation_description": "The Apigee environment debug mask does not use approved JSONPath expressions to mask sensitive data in request-message debug output.",
            "remedies": [
                "Add approved sensitive request fields to request_json_paths.",
                "Ensure that each JSONPath expression matches the structure of the API request payload.",
                "Review request payloads for passwords, tokens, personal information, payment information, and other sensitive values."
            ]
        },
        {
            "condition": "Check whether request_json_paths contains only approved JSONPath expressions.",
            "attribute_path": [
                "request_json_paths"
            ],
            "values": [
                "$.password",
                "$.accessToken"
            ],
            "policy_type": "whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays detailed compliance results for each resource
details := helpers.get_multi_summary(conditions, vars.variables).details
