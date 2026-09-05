package terraform.gcp.security.bigquery.google_bigquery_job.load_source_uris
import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_job.vars

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

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
