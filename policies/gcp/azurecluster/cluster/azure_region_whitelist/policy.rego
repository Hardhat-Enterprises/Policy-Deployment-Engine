package terraform.gcp.security.azurecluster.cluster.azure_region_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azurecluster.cluster.azure_region_whitelist.vars

approved_regions := ["australiaeast", "australiasoutheast", "uswest1"]

scenarios_list := [
  {
    "situation_description": "🗺️ Azure Region must be from the approved list",
    "remedies": ["✅ Use a region such as australiaeast, australiasoutheast, or uswest1"],
    "condition": "C1: Region not whitelisted",
    "attribute_path": ["azure_region"],
    "values": approved_regions,
    "policy_type": "whitelist"
  }
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

# Create scorecard output
scorecard := [
  "📍 Azure Region Compliance Check",
  "────────────────────────────────────",
  sprintf("🔎 Clusters reviewed: %v", [count(vars.variables)]),
  sprintf("❌ Non-compliant clusters: %v", [count([res | s := summary.details[_]; res := s.non_compliant_resources[_]])])
]

violations := [
  sprintf("🚫 Cluster '%s' uses disallowed Azure region: '%s'", [res.name, res.azure_region])
  | s := summary.details[_]
  res := s.non_compliant_resources[_]
  res.azure_region != null
]

message := array.concat(scorecard, violations)
detail := summary.details
