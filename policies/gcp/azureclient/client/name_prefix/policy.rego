package terraform.gcp.security.azureclient.client.name_prefix

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azureclient.client.name_prefix.vars

required_prefix := "client-"

scenarios_list := [
  {
    "situation_description": "🚫 Azure Client name must start with the approved prefix",
    "remedies": ["✅ Use a name starting with the prefix: client-"],
    "condition": "C1: Name does not start with the required prefix",
    "attribute_path": ["name"],
    "values": [required_prefix],
    "policy_type": "pattern whitelist"
  }
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

total := count(vars.variables)
violating := count([res | s := summary.details[_]; res := s.non_compliant_resources[_]])

base_msgs := [
  sprintf("📦 Total Azure Clients detected: %v", [total]),
  sprintf("🚫 Non-compliant clients: %v/%v", [violating, total])
]

violation_msgs := [
  sprintf("❌ Client '%s' does not start with required prefix '%s'", [res.name, required_prefix])
  | s := summary.details[_]
  res := s.non_compliant_resources[_]
  res.name != null
]

message := array.concat(base_msgs, violation_msgs)
detail := summary.details
