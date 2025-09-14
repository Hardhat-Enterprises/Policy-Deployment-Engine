package terraform.gcp.security.web_app.auth_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.web_app.vars

conditions := [
    [
        {"situation_description": "Bucket must be in US region",
         "remedies": ["Move bucket to US"]},
        {
            "condition": "Check if bucket location is US",
            "attribute_path": ["location"],
            "values": ["US"],
            "policy_type": "whitelist"
        }
    ],
    [
        {"situation_description": "Bucket name must start with 'compliant-'",
         "remedies": ["Rename bucket to start with compliant-"]},
        {
            "condition": "Check bucket name prefix",
            "attribute_path": ["name"],
            "values": ["compliant-*"],
            "policy_type": "pattern whitelist"
        }
    ]
]

# Messages
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
