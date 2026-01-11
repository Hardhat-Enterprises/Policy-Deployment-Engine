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

            # Correct nested attribute path
            "attribute_path": ["config_bundle"],

            # Allow only org names that match this pattern
            "values": ["proxies/MyProxy.zip"],

            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
