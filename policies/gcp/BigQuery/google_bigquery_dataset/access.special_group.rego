package terraform.gcp.security.BigQuery.google_bigquery_dataset.access_special_group

import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_dataset.vars

conditions := [
    [
        {
            "situation_description": "A dataset access entry grants access to all authenticated BigQuery users, exposing dataset contents too broadly.",
            "remedies": [
                "Remove allAuthenticatedUsers and grant access only to an approved project-scoped group"
            ]
        },
        {
            "condition": "Reject public authenticated-user access",
            "attribute_path": ["access", "special_group"],
            "values": ["allAuthenticatedUsers"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
