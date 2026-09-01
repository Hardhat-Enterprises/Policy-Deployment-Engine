package terraform.gcp.security.BigQuery.google_bigquery_dataset.delete_contents_on_destroy

import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_dataset.vars

conditions := [
    [
        {
            "situation_description": "Check destructive dataset content deletion",
            "remedies": ["Set delete_contents_on_destroy to false"]
        },
        {
            "condition": "Prevent deletion of dataset contents on destroy",
            "attribute_path": ["delete_contents_on_destroy"],
            "values": false,
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
