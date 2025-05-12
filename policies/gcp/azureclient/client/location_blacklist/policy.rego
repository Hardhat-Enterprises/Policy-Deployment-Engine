package terraform.gcp.security.azureclient.client.location_blacklist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azureclient.client.location_blacklist.vars

blacklisted_locations := ["global", "unapproved-region"]

scenarios_list := [
  {
    "situation_description": "🚫 Azure client must not use blacklisted locations",
    "remedies": ["✅ Use a region outside the blacklisted list"],
    "condition": "C1: Location is blacklisted",
    "attribute_path": ["location"],
    "values": blacklisted_locations,
    "policy_type": "blacklist"
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
  sprintf("❌ Client '%s' is using blacklisted location: '%s'", [res.name, res.location])
  | s := summary.details[_]
  res := s.non_compliant_resources[_]
  res.location != null
]

message := array.concat(base_msgs, violation_msgs)
detail := summary.details
