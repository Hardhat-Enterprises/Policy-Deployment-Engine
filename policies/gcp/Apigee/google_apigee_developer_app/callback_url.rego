package terraform.gcp.security.apigee.google_apigee_developer_app.callback_url

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_developer_app.vars

conditions := [
    [
        {
            "situation_description": "callback_url should be compliant",
            "remedies": [
                "Ensure callback_url should is compliant"
            ]
        },
        {
            "condition": "check callback_url should is compliant",
            "attribute_path": ["callback_url"],
            "values": ["https://example-call.url"],

            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
