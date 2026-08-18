package terraform.gcp.security.apigee.google_apigee_environment_debugmask.response_x_paths

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_environment_debugmask.vars

conditions := [
    [
        {
            "situation_description": "The Apigee environment debug mask does not use approved XPath expressions to mask sensitive XML data in response-message debug output.",
            "remedies": [
                "Add approved sensitive XML response fields to response_x_paths.",
                "Ensure that each XPath expression matches the API response structure.",
                "Review response payloads for access tokens, personal information, payment information, and other sensitive values."
            ]
        },
        {
            "condition": "Check whether response_x_paths contains only approved XPath expressions.",
            "attribute_path": [
                "response_x_paths"
            ],
            "values": [
                "//accessToken",
                "//customer/email"
            ],
            "policy_type": "whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays detailed compliance results for each resource
details := helpers.get_multi_summary(conditions, vars.variables).details
