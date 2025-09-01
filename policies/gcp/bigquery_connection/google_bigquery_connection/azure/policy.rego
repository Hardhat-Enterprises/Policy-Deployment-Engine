package terraform.gcp.security.bigquery_connection.google_bigquery_connection.azure

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars


conditions := [[
  {
    "situation_description": "Azure BigQuery connection must use approved tenant and federated application client IDs",
    "remedies": [
      "Set azure.customer_tenant_id to an approved tenant ID",
      "Set azure.federated_application_client_id to an approved client ID"
    ]
  },
  {
    "condition": "azure.customer_tenant_id must be approved",
    "attribute_path": ["azure", 0, "customer_tenant_id"],
    "values": [
      "11111111-1111-1111-1111-111111111111"  # <- keep in sync with c.tf
    ],
    "policy_type": "whitelist"
  },
  {
    "condition": "azure.federated_application_client_id must be approved",
    "attribute_path": ["azure", 0, "federated_application_client_id"],
    "values": [
      "22222222-2222-2222-2222-222222222222"  
    ],
    "policy_type": "whitelist"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

