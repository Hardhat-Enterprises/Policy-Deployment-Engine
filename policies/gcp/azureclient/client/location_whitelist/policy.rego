package terraform.gcp.security.azureclient.client.location_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azureclient.client.location_whitelist.vars

approved_locations := ["australia-southeast1", "australiaeast", "us-west1"]

scenarios_list := [
  {
    "situation_description": "🚫 Azure Client must be deployed in an approved location",
    "remedies": ["✅ Use a region from the approved list"],
    "condition": "C1: Location is not in the whitelist",
    "attribute_path": ["location"],
    "values": approved_locations,
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
  sprintf("❌ Client '%s' is using an unapproved location: '%s'", [res.name, res.location])
  | s := summary.details[_]
  res := s.non_compliant_resources[_]
  res.location != null
]

message := array.concat(base_msgs, violation_msgs)
detail := summary.details
