package terraform.gcp.security.bigquery_connection.google_bigquery_connection.cloud_resource.service_account_id
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [[
  {
    "situation_description": "BigQuery connection (cloud_resource) must use an approved service account",
    "remedies": [
      "Set cloud_resource.service_account_id to one of the approved service account emails"
    ]
  },
  {
    "condition": "cloud_resource.service_account_id must be in the approved whitelist",
    "attribute_path": ["cloud_resource", 0, "service_account_id"],
    "values": [
      "bq-conn-sa@my-project.iam.gserviceaccount.com",
      "etl-runner@analytics-prod.iam.gserviceaccount.com"
    ],
    "policy_type": "whitelist"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
policy := {"message": message, "details": details}
