package terraform.gcp.security.bigquery.google_bigquery_table.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_table.vars

conditions := [
    [
        {
            "situation_description": "Check table deletion_policy",
            "remedies": ["Set deletion_policy to PREVENT"]
        },
        {
            "condition": "Require deletion_policy PREVENT",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
