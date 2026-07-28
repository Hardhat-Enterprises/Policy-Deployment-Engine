package terraform.gcp.security.apigee.google_apigee_api_product.scopes

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_api_product.vars

conditions := [
    [
        {
            "situation_description": "scopes should be compliant",
            "remedies": [
                "Ensure scopes should is compliant"
            ]
        },
        {
            "condition": "check scopes should is compliant",
            "attribute_path": ["scopes"],
            "values": ["read:*"],

            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
