package terraform.gcp.security.bigquery_connection.google_bigquery_connection.kms_key_name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars

conditions := [[
  {
    "situation_description": "Require CMEK key in approved AU regions",
    "remedies": [
      "Set kms_key_name to a Cloud KMS key in australia-southeast1 or australia-southeast2"
    ]
  },
  {
    "condition": "kms_key_name must match AU KMS key resource pattern",
    "attribute_path": ["kms_key_name"],
    "values": [
       "^projects/my-project-c/locations/australia-southeast2/keyRings/australia-southeast2/cryptoKeys/bq-key(?:/cryptoKeyVersions/[0-9]+)?$", 
       "projects/my-project-nc/locations/US/keyRings/us/cryptoKeys/bq-key(?:/cryptoKeyVersions/[0-9]+)?$"

    ],
    "policy_type": "pattern whitelist"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
