package terraform.gcp.security.bigquery_connection.google_bigquery_connection.azure.customer_tenant_id
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars

conditions := [[
  {
    "situation_description": "Require Azure customer tenant id to be approved",
    "remedies": ["Set azure.customer_tenant_id to an approved tenant id"]
  },
  {
    "condition": "customer_tenant_id must be approved",
    "attribute_path": ["azure",0,"customer_tenant_id"],
    "policy_type": "whitelist",
    "values": ["11111111-1111-1111-1111-111111111111"]
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
