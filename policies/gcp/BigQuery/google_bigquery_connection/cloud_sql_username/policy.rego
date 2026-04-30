package terraform.gcp.security.BigQuery.google_bigquery_connection.cloud_sql_username
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_connection.vars

conditions := [
    [
        {"situation_description": "cloud_sql username is empty, which may allow unauthorised access to the Cloud SQL database", "remedies": ["Set a non-empty username in the cloud_sql credential block"]},
        {
            "condition": "Check if cloud_sql username is non-empty",
            "attribute_path": ["cloud_sql", "credential", "username"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details