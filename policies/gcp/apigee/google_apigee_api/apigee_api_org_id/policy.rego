package terraform.gcp.security.apigee.google_apigee_api.apigee_api_org_id

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_api.vars

conditions := [
    [
        {
            "situation_description": "org_id should be compliant",
            "remedies": [
                "Ensure org_id should is compliant"
            ]
        },
        {
            "condition": "check org_id should is compliant",

            # Correct nested attribute path
            "attribute_path": ["org_id"],

            # Allow only org names that match this pattern
            "values": ["PDE-API-Proxy"],

            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
