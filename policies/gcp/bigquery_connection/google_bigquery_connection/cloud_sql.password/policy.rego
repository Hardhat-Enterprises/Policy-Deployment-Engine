package terraform.gcp.security.bigquery_connection.google_bigquery_connection.cloud_sql.password # Edit here
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars

conditions := [
    [
      {
        "situation_description": "Disallow high-priv/default Cloud SQL usernames for BigQuery Cloud SQL connections",
        "remedies": [
          "Create and use a dedicated least-privileged DB user",
          "Avoid root/admin/postgres/mysql"
        ]
      },
      {
        "condition": "Username must not be a known high-priv/default",
        "attribute_path": ["cloud_sql", 0, "credential", 0, "username"],
        "values": ["root", "admin", "postgres", "mysql"],                
        "policy_type": "blacklist"                                       
      }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
