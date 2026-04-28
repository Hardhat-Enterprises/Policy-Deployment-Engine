package terraform.gcp.security.apigee.google_apigee_environment.apigee_environment_api_proxy_type

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_environment.vars

conditions := [
    [
        {
            "situation_description": "Apigee Environment api_proxy_type is set to API_PROXY_TYPE_UNSPECIFIED which does not enforce a defined proxy execution model",
            "remedies": [
                "Set api_proxy_type to PROGRAMMABLE for standard Apigee proxy development",
                "Set api_proxy_type to CONFIGURABLE for no-code API proxy configuration"
            ]
        },
        {
            "condition": "Check that api_proxy_type is not API_PROXY_TYPE_UNSPECIFIED",
            "attribute_path": ["api_proxy_type"],
            "values": ["API_PROXY_TYPE_UNSPECIFIED"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details