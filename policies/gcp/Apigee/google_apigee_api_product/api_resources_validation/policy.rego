package terraform.gcp.security.apigee.google_apigee_api_product.api_resources_validation

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_api_product.vars

conditions := [
    [
        {
            "situation_description": "api_resources should be compliant",
            "remedies": [
                "Ensure api_resources should is compliant"
            ]
        },
        {
            "condition": "check api_resources should is compliant",
            "attribute_path": ["api_resources"],
            "values": ["/weather/**"],

            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
