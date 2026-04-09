package terraform.gcp.security.bigquery_connection.google_bigquery_connection.kms_key_name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars

conditions := [[
  {
    "situation_description": "Require CMEK key in approved AU regions",
    "remedies": [
      "Set kms_key_name to a Cloud KMS key under locations/australia-southeast1 or locations/australia-southeast2"
    ]
  },
  {
    "condition": "kms_key_name must reference a Cloud KMS key in australia-southeast1 or australia-southeast2",
    "attribute_path": ["after", "kms_key_name"],
    "values": [
      "(?i)^projects/[^/]+/locations/australia-southeast(1|2)/keyRings/[^/]+/cryptoKeys/[^/]+$"
    ],
    "policy_type": "pattern whitelist"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
