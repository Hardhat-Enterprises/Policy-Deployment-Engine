package terraform.gcp.security.BigQuery.google_bigquery_job.query_connection_properties_key
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_job.vars

conditions := [
    [
        {"situation_description" : "A query connection property has an empty or unrecognised key, so the setting it was meant to apply — session, timezone or default project — is silently ignored at run time.",
         "remedies": ["Set key to a connection property BigQuery recognises, such as session_id, time_zone or dataset_project_id", "Or remove the connection_properties block if none of those is what you meant to set"]},
        {
            "condition": "Check for valid_key",
            "attribute_path": ["query", 0, "connection_properties", 0, "key"],
            "values" : "valid_key", 
            "policy_type" : "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
