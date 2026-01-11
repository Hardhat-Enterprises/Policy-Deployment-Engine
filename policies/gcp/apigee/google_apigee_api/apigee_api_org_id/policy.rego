package terraform.gcp.apigee.google_apigee_api.apigee_api_org_id

import data.terraform.helpers
import data.terraform.gcp.apigee.google_apigee_api.vars

conditions := [
    [
        {
            "situation_description": "Apigee API org_id is not compliant.",
            "remedies": [
                "Ensure org_id is set valid"
            ]
        },
        {
            "condition": "Check if org_id is set valid",
            "attribute_path": ["org_id"],
            "values": ["PDE-API-Proxy"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
