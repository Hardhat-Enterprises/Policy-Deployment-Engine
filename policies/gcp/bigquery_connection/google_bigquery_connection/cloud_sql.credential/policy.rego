package terraform.gcp.security.bigquery_connection.google_bigquery_connection.cloud_sql.credential
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars

conditions := [[
  {
    "situation_description": "Require Cloud SQL credential username to be appuser",
    "remedies": [
      "Set credential.username to appuser"
    ]
  },
  {
    "condition": "credential.username must be appuser",
    "attribute_path": ["cloud_sql", 0, "credential", 0, "username"],
    "policy_type": "whitelist",
    "values": ["appuser"]
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
