package terraform.gcp.security.BigQuery.google_bigquery_connection.cloud_sql_username
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_connection.vars

conditions := [
    [
        {
            "situation_description": "cloud_sql credential username is set to a default or shared account name (e.g. 'root', 'admin'), which violates the principle of least privilege and increases blast radius if compromised",
            "remedies": [
                "Set cloud_sql.credential.username to a dedicated service account name, not a default like 'root' or 'admin'",
                "Use a least-privilege username scoped to only the operations BigQuery needs"
            ]
        },
        {
            "condition": "username must not be a default or shared account name",
            "attribute_path": ["cloud_sql", 0, "credential", 0, "username"],
            "values": ["root", "admin", "postgres", "mysql", "sa"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details