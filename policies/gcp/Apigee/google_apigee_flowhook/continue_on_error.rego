package terraform.gcp.security.apigee.google_apigee_flowhook.continue_on_error

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_flowhook.vars

conditions := [
    [
        {
            "situation_description": "The Apigee flow hook allows API processing to continue when its shared flow fails, which could bypass security controls implemented by the shared flow.",
            "remedies": [
                "Set continue_on_error to false.",
                "Investigate and resolve failures in the attached shared flow.",
                "Use fail-closed behaviour for shared flows that implement security controls."
            ]
        },
        {
            "condition": "Check whether API processing stops when the flow hook throws an exception.",
            "attribute_path": [
                "continue_on_error"
            ],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

# Evaluates the conditions once and stores the result
result := helpers.get_multi_summary(conditions, vars.variables)

# Displays a general message about policy compliance
message := result.message

# Displays detailed compliance results for each resource
details := result.details
