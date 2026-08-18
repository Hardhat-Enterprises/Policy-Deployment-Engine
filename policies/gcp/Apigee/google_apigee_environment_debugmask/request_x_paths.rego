package terraform.gcp.security.apigee.google_apigee_environment_debugmask.request_x_paths

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_environment_debugmask.vars

conditions := [
    [
        {
            "situation_description": "The Apigee environment debug mask does not use approved XPath expressions to mask sensitive XML data in request-message debug output.",
            "remedies": [
                "Add approved sensitive XML request fields to request_x_paths.",
                "Ensure that each XPath expression matches the API request structure.",
                "Review request payloads for passwords, tokens, personal information, payment information, and other sensitive values."
            ]
        },
        {
            "condition": "Check whether request_x_paths contains only approved XPath expressions.",
            "attribute_path": [
                "request_x_paths"
            ],
            "values": [
                "//password",
                "//accessToken"
            ],
            "policy_type": "whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays detailed compliance results for each resource
details := helpers.get_multi_summary(conditions, vars.variables).details
