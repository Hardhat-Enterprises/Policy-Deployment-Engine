package terraform.gcp.security.bigquery_connection.google_bigquery_connection.azure.federated_application_client_id
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars

conditions := [[
  {
    "situation_description": "Require Azure federated application client id to be approved",
    "remedies": ["Set azure.federated_application_client_id to an approved client id"]
  },
  {
    "condition": "federated_application_client_id must be approved",
    "attribute_path": ["azure",0,"federated_application_client_id"],
    "policy_type": "whitelist",
    "values": ["22222222-2222-2222-2222-222222222222"]
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
