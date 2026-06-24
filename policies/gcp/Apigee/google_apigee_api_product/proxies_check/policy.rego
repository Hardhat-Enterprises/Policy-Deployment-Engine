package terraform.gcp.security.apigee.google_apigee_api_product.proxies_check

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_api_product.vars

conditions := [
    [
        {
            "situation_description": "proxy_id should be compliant",
            "remedies": [
                "Ensure proxy_id should is compliant"
            ]
        },
        {
            "condition": "check proxy_id should is compliant",
            "attribute_path": ["proxies"],
            "values": ["proxies-compliant"],

            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
