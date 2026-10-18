package terraform.gcp.security.apigee.google_apigee_organization.analytics_region

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_organization.vars

conditions := [
    [
        {
            "situation_description": "Apigee Organization analytics_region is not set to an approved Australian region which may violate data residency and compliance requirements",
            "remedies": [
                "Set analytics_region to an approved Australian region",
                "Approved regions are: australia-southeast1, australia-southeast2"
            ]
        },
        {
            "condition": "Check if analytics_region is in the approved Australian whitelist",
            "attribute_path": ["analytics_region"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
