package terraform.gcp.security.apigee.google_apigee_api_product.approval_type

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_api_product.vars

conditions := [
    [
        {
            "situation_description": "approval_type should be compliant",
            "remedies": [
                "Ensure approval_type should is compliant"
            ]
        },
        {
            "condition": "check approval_type should is compliant",
            "attribute_path": ["approval_type"],
            "values": ["manual"],

            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
