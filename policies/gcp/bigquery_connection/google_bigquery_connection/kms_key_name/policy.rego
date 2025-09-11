package terraform.gcp.security.bigquery_connection.google_bigquery_connection.kms_key_name
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars

conditions := [[
  {
    "situation_description": "Disallow unapproved KMS keys for BigQuery connections",
    "remedies": ["Use kms_key_name from approved AU regions"]
  },
  {
    "condition": "kms_key_name must not be in the disallowed list",
    "attribute_path": ["kms_key_name"],
    "values": [
      "projects/my-project-nc/locations/us-central1/keyRings/kr/cryptoKeys/bq-key-us"
    ],
    "policy_type": "blacklist"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
