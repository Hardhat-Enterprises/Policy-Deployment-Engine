package terraform.gcp.security.BigQuery.google_bigquery_table_iam_policy.policy_data

import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_table_iam_policy.vars

# Merged policy for `policy_data` — 2 independent scenarios, each a
# situation in `conditions`, evaluated separately by helpers.get_multi_summary.
conditions := [
[
        {"situation_description" : "Check for valid members",
         "remedies": ["Add valid members"]},
        {
            "condition": "Check for valid_members",
            "attribute_path": ["policy_data"],
            "values" : ["{\"bindings\":[{\"members\":[\"user:jane@example.com\"],\"role\":\"roles/bigquery.dataOwner\"}]}"],
            "policy_type" : "whitelist"
        }
    ],
[
        {"situation_description" : "Check for valid role",
         "remedies": ["Add valid role"]},
        {
            "condition": "Check for valid_role",
            "attribute_path": ["policy_data"],
            "values" : ["{\"bindings\":[{\"members\":[\"user:jane@example.com\"],\"role\":\"roles/bigquery.dataOwner\"}]}"],
            "policy_type" : "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
