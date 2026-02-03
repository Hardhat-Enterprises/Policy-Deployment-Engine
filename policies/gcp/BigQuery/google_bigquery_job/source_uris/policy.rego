package terraform.gcp.security.BigQuery.google_bigquery_job.source_uris
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_job.vars

conditions := [
    [
        {"situation_description" : "Check for valid source_uris",
         "remedies": ["Add valid source_uris"]},
        {
            "condition": "Check for valid_source_uris",
            "attribute_path": ["load", 0, "source_uris"],
            "values" : ["valid_uris"],
            "policy_type" : "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details