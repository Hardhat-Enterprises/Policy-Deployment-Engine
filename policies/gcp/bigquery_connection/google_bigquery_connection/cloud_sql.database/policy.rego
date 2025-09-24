package terraform.gcp.security.bigquery_connection.google_bigquery_connection.cloud_sql.database
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars
#
conditions := [
  [
    {
      "situation_description": "Prevent Terraform from using default/system databases for Cloud SQL federation",
      "remedies": ["Use a dedicated application database (e.g., appdb_prod) instead of system DBs"]
    },
    {
      "condition": "cloud_sql.database must not be a known system/default database",
      "attribute_path": ["cloud_sql", 0, "database"],
      "values": ["postgres","mysql","master","template0","template1","sys","information_schema"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
