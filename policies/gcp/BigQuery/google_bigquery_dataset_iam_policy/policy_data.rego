package terraform.gcp.security.BigQuery.google_bigquery_dataset_iam_policy.policy_data

import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_dataset_iam_policy.vars

# Merged policy for `policy_data` — 2 independent scenarios, each a
# situation in `conditions`, evaluated separately by helpers.get_multi_summary.
conditions := [
[
        {"situation_description" : "allUsers detected",
         "remedies": ["Remove access from allUsers"]},
        {
            "condition": "Check for iam_member containing allUsers",
            "attribute_path" : ["policy_data"],
            "values" : "{\"bindings\":[{\"members\":[\"allUsers\"],\"role\":\"roles/bigquery.dataViewer\"}]}", 
            "policy_type" : "Blacklist"
        }
    ],
[
        {"situation_description" : "allUsers detected",
         "remedies": ["Remove access from allUsers"]},
        {
            "condition": "Check for iam_member containing allUsers",
            "attribute_path" : ["policy_data"],
            "values" : "{\"bindings\":[{\"members\":[\"user:fakeuser@example.com\"],\"role\":\"roles/bigquery.dataViewer\"}]}", 
            "policy_type" : "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
