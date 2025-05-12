package terraform.gcp.security.azurecluster.cluster.name_prefix

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azurecluster.cluster.name_prefix.vars

required_prefix := "prod-"

scenarios_list := [
  {
    "situation_description": "🔤 Cluster name must start with the prefix 'prod-'",
    "remedies": ["✅ Rename the cluster to start with 'prod-'"],
    "condition": "C1: Cluster name does not follow naming convention",
    "attribute_path": ["name"],
    "values": [required_prefix],
    "policy_type": "pattern whitelist"
  }
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

# 🎯 Create badge-style summary
badge := [
  "🏷️ Cluster Naming Convention Report",
  "──────────────────────────────────────",
  sprintf("🔎 Clusters checked: %v", [count(vars.variables)]),
  sprintf("🟥 Clusters with naming issues: %v", [count([res | s := summary.details[_]; res := s.non_compliant_resources[_]])])
]

violations := [
  sprintf("❌ '%s' is not using the required prefix '%s'", [res.name, required_prefix])
  | s := summary.details[_]
  res := s.non_compliant_resources[_]
  res.name != null
]

message := array.concat(badge, violations)
detail := summary.details
