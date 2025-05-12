package terraform.gcp.security.azurecluster.cluster.fleet_project_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azurecluster.cluster.fleet_project_whitelist.vars

approved_fleet_projects := ["chrome-ability-456100-t1", "prod-fleet-789", "secure-fleet"]

scenarios_list := [
  {
    "situation_description": "🔗 Fleet project must be in the approved project list",
    "remedies": ["✅ Use a fleet.project from the approved list"],
    "condition": "C1: Unauthorized fleet project",
    "attribute_path": ["fleet", 0, "project"],
    "values": approved_fleet_projects,
    "policy_type": "whitelist"
  }
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

# 🧾 Fleet Project Validation Report
header := [
  "🛰️ Fleet Project Assignment Audit",
  "────────────────────────────────────────────",
  sprintf("🧩 Clusters scanned: %v", [count(vars.variables)]),
  sprintf("🚫 Unauthorized fleet assignments: %v", [count([res | s := summary.details[_]; res := s.non_compliant_resources[_]])])
]

violations := [
  sprintf("❌ Cluster '%s' assigned to unauthorized fleet project: '%s'", [res.name, res.fleet[0].project])
  | s := summary.details[_]
  res := s.non_compliant_resources[_]
  res.fleet[0].project != null
]

message := array.concat(header, violations)
detail := summary.details
