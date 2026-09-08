package terraform.gcp.security.apigee.google_apigee_api_deployment.proxy_id

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_api_deployment.vars

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
            "attribute_path": ["proxy_id"],
            "values": ["apigee-proxy-c"],

            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
