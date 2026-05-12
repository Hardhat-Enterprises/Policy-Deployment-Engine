package terraform.gcp.security.apigee.google_apigee_organization.apigee_organization_retention

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_organization.vars

conditions := [
    [
        {
            "situation_description": "Apigee Organization retention is set to DELETION_RETENTION_UNSPECIFIED which does not guarantee minimum data retention after deletion",
            "remedies": [
                "Set retention to MINIMUM to ensure organization data is retained for the minimum period after deletion",
                "This allows recovery of the organization if accidentally deleted"
            ]
        },
        {
            "condition": "Check if retention is not DELETION_RETENTION_UNSPECIFIED",
            "attribute_path": ["retention"],
            "values": ["DELETION_RETENTION_UNSPECIFIED"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
