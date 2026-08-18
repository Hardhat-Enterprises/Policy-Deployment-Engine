package terraform.gcp.security.BigQuery.google_bigquery_routine.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_routine.vars

conditions := [
    [
        {
            "situation_description": "Check for safe deletion_policy",
            "remedies": ["Set deletion_policy to PREVENT"]
        },
        {
            "condition": "Require deletion protection",
            "attribute_path": ["deletion_policy"],
            "values": "PREVENT",
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
