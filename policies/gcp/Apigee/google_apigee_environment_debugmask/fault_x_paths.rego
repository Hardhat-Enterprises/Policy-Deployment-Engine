package terraform.gcp.security.apigee.google_apigee_environment_debugmask.fault_x_paths

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_environment_debugmask.vars

conditions := [
    [
        {
            "situation_description": "The Apigee environment debug mask does not use approved XPath expressions to mask sensitive XML data in fault-message debug output.",
            "remedies": [
                "Add approved sensitive XML fields to fault_x_paths.",
                "Ensure that the XPath expressions match the structure of API fault messages.",
                "Review fault payloads for credentials, tokens, personal information, and other sensitive values."
            ]
        },
        {
            "condition": "Check whether fault_x_paths contains only approved XPath expressions.",
            "attribute_path": [
                "fault_x_paths"
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
