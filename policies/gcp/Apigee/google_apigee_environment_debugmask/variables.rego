package terraform.gcp.security.apigee.google_apigee_environment_debugmask.variables

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_environment_debugmask.vars

conditions := [
    [
        {
            "situation_description": "The Apigee environment debug mask does not mask the approved sensitive flow variables, which could expose authentication information in debug sessions.",
            "remedies": [
                "Add approved sensitive flow variables to the variables list.",
                "Mask authorization headers, API keys, tokens, credentials, and other sensitive variables.",
                "Review API proxy flows to identify additional variables containing sensitive data."
            ]
        },
        {
            "condition": "Check whether the debug mask contains only approved sensitive flow variables.",
            "attribute_path": [
                "variables"
            ],
            "values": [
                "request.header.authorization",
                "request.queryparam.api_key"
            ],
            "policy_type": "whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays detailed compliance results for each resource
details := helpers.get_multi_summary(conditions, vars.variables).details
