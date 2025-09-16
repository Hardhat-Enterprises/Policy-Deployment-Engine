package terraform.gcp.security.bigquery_connection.google_bigquery_connection.kms_key_name
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars

conditions := [[
  {
    "situation_description": "Allow only approved KMS keys for BigQuery connections",
    "remedies": ["Use kms_key_name from approved AU regions"]
  },
  {
    "condition": "kms_key_name must match an approved pattern and region",
    "attribute_path": ["kms_key_name"],
    "values": [
      "projects/my-project-c/locations/*/keyRings/kr/cryptoKeys/bq-key-au",
      ["australia-southeast2", "australia-southeast1"]
    ],
    "policy_type": "pattern whitelist"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

