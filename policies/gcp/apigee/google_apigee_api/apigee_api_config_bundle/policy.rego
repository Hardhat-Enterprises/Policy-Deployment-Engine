package terraform.gcp.security.apigee.google_apigee_api.apigee_api_config_bundle

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_api.vars

conditions := [
    [
        {
            "situation_description": "config_bundle should be compliant",
            "remedies": [
                "Ensure config_bundle should is compliant"
            ]
        },
        {
            "condition": "check config_bundle should is compliant",
            "attribute_path": ["config_bundle"],
            "values": ["proxies/MyProxy.zip"],

            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
