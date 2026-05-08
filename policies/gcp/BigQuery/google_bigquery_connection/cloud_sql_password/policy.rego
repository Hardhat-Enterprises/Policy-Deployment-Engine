package terraform.gcp.security.BigQuery.google_bigquery_connection.cloud_sql_password
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_connection.vars

conditions := [
    [
        {"situation_description": "cloud_sql password is empty, which may allow unauthorised access to the Cloud SQL database", "remedies": ["Set a non-empty password of at least 12 characters in the cloud_sql credential block"]},
        {
            "condition": "Check if cloud_sql password is non-empty",
            "attribute_path": ["cloud_sql", 0, "credential", 0, "password"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details