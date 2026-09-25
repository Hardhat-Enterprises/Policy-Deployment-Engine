package terraform.gcp.security.bigquery.google_bigquery_dataset.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_dataset.vars

conditions := [
    [
        {
            "situation_description": "Check dataset deletion protection",
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

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
