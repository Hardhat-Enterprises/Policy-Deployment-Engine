package terraform.gcp.security.apigee.google_apigee_organization.apigee_organization_analytics_region

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_organization.vars

conditions := [
    [
        {
            "situation_description": "Apigee Organization analytics_region is not set to an approved region which may violate data residency and compliance requirements",
            "remedies": [
                "Set analytics_region to an approved region",
                "Approved regions are: us-central1, europe-west1, asia-east1"
            ]
        },
        {
            "condition": "Check if analytics_region is in the approved whitelist",
            "attribute_path": ["analytics_region"],
            "values": ["us-central1", "europe-west1", "asia-east1"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
