package terraform.gcp.security.azureclient.client.tenant_id_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azureclient.vars

conditions := [
  {
    "situation_description": "Only approved tenant_id values are allowed for GCP Azure Clients",
    "remedies": ["Use a tenant_id that is part of the organization's approved list"],
    "condition": "C1: Unauthorized tenant_id",
    "attribute_path": ["tenant_id"],
    "values": ["12345678-aaaa-bbbb-cccc-1234567890ab", "87654321-bbbb-aaaa-dddd-0987654321cd"],
    "policy_type": "whitelist"
  }
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
detail := summary.details
