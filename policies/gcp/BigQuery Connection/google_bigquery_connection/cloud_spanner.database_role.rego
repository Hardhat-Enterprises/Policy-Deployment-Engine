package terraform.gcp.security.bigquery.google_bigquery_connection.cloud_spanner_database_role

import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_connection.vars

conditions := [
    [
    {"situation_description" : "cloud_spanner.database_role uses an untrusted/overly-permissive role",
    "remedies":[ "Only use approved, least-privilege database roles for this connection"]},
    {
        "condition": "Test if database_role is the untrusted admin role",
        "attribute_path" : ["cloud_spanner", 0, "database_role"],
        "values" : ["untrusted_admin_role"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
