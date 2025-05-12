package terraform.gcp.security.azureclient.client.project_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azureclient.client.project_whitelist.vars

approved_projects := ["approved-project", "secure-project-1", "prod-project-xyz"]

scenarios_list := [
  {
    "situation_description": "🚫 Azure client project must be from the approved list",
    "remedies": ["✅ Use one of the approved project names"],
    "condition": "C1: Project name is not approved",
    "attribute_path": ["project"],
    "values": approved_projects,
    "policy_type": "whitelist"
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
  sprintf("❌ Client '%s' uses unapproved project: '%s'", [res.name, res.project])
  | s := summary.details[_]
  res := s.non_compliant_resources[_]
  res.project != null
]

message := array.concat(base_msgs, violation_msgs)
detail := summary.details
