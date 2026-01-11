package terraform.gcp.apigee.google_apigee_api.apigee_api_config.bundle

import data.terraform.helpers
import data.terraform.gcp.apigee.google_apigee_api.vars

conditions := [
    [
        {
            "situation_description": "Apigee API config_bundle is not compliant.",
            "remedies": [
                "Ensure config_bundle is provided and points to a .zip archive"
            ]
        },
        {
            "condition": "Check if config_bundle is a zip archive",
            "attribute_path": ["config_bundle"],
            "values": ["proxies/MyProxy.zip"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
