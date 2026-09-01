package terraform.gcp.security.BigQuery.google_bigquery_dataset.access_iam_member

import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_dataset.vars

conditions := [
    [
        {
            "situation_description": "A dataset access entry grants access to a public IAM principal, exposing dataset contents broadly.",
            "remedies": [
                "Remove public IAM principals such as allUsers or allAuthenticatedUsers",
                "Grant access only to an explicitly authorised non-public principal"
            ]
        },
        {
            "condition": "Reject public IAM members",
            "attribute_path": ["access", "iam_member"],
            "values": ["allUsers", "allAuthenticatedUsers"],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
