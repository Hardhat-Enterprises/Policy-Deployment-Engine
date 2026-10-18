package terraform.gcp.security.apigee.google_apigee_environment_debugmask.variables

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_environment_debugmask.vars

conditions := [
    [
        {
            "situation_description": "The Apigee environment debug mask does not configure any flow variables for masking, which could expose sensitive values during debug sessions.",
            "remedies": [
                "Add sensitive flow variables to the variables list.",
                "Mask authorization headers, API keys, tokens, credentials, and other sensitive variables.",
                "Review each API proxy flow for custom variables containing sensitive information."
            ]
        },
        {
            "condition": "Check whether the debug mask contains at least one masked flow variable.",
            "attribute_path": [
                "variables"
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
