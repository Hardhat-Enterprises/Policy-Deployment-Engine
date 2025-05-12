package terraform.gcp.security.azureclient.client.tenant_id_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azureclient.client.tenant_id_whitelist.vars

approved_tenants := [
  "12345678-aaaa-bbbb-cccc-1234567890ab",
  "87654321-bbbb-aaaa-dddd-0987654321cd"
]

scenarios_list := [
  {
    "situation_description": "🚨 Tenant ID must be from the approved list",
    "remedies": ["✅ Use a tenant_id from the whitelist"],
    "condition": "C1: Invalid tenant_id detected",
    "attribute_path": ["tenant_id"],
    "values": approved_tenants,
    "policy_type": "whitelist"
  }
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

total := count(vars.variables)
violating := count([res | s := summary.details[_]; res := s.non_compliant_resources[_]])

base_msgs := [
  sprintf("📦 Total GCP Azure Clients detected: %v", [total]),
  sprintf("🚫 Non-compliant clients: %v/%v", [violating, total])
]

violation_msgs := [
  sprintf("❌ Client '%s' uses unapproved tenant_id: '%s'", [res.name, res.tenant_id])
  | s := summary.details[_]
  res := s.non_compliant_resources[_]
]

message := array.concat(base_msgs, violation_msgs)


detail := summary.details
