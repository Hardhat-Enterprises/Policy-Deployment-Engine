package terraform.gcp.security.bigquery.google_bigquery_connection.cloud_sql_credential_password

import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_connection.vars

conditions := [
    [
    {"situation_description" : "cloud_sql.credential.password is empty, permitting anonymous access",
    "remedies":[ "Set a non-empty password for the database credential"]},
    {
        "condition": "Test if password is empty",
        "attribute_path" : ["cloud_sql", 0, "credential", 0, "password"],
        "values" : [""],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
