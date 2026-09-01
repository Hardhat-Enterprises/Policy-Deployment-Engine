package terraform.gcp.security.BigQuery.google_bigquery_dataset.access_condition_expression

import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_dataset.vars

conditions := [
    [
        {
            "situation_description": "A dataset access condition uses an empty or unconditional expression, causing the access binding to apply without a meaningful restriction.",
            "remedies": [
                "Replace the unconditional expression with a meaningful CEL condition that restricts when the access binding applies"
            ]
        },
        {
            "condition": "Reject clearly unconditional access conditions",
            "attribute_path": ["access", "condition", "expression"],
            "values": ["", "true", "1 == 1"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
