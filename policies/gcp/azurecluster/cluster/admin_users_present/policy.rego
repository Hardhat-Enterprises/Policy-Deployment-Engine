package terraform.gcp.security.azurecluster.cluster.admin_users_present

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azurecluster.cluster.admin_users_present.vars

approved_admins := ["admin@example.com", "supervisor@company.com"]

scenarios_list := [
  {
    "situation_description": "🚨 [Cluster Admin Policy] Unauthorized admin users present",
    "remedies": ["✅ Only allow admin users from the approved list"],
    "condition": "C1: admin_users includes unauthorized usernames",
    "attribute_path": ["authorization", 0, "admin_users", 0, "username"],
    "values": approved_admins,
    "policy_type": "whitelist"
  }
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

# ✅ Create summary header separately
header := [
  "🔒 Admin Audit Report for Azure Clusters",
  sprintf("🧪 Total clusters reviewed: %v", [count(vars.variables)]),
  sprintf("🚫 Violations found: %v", [count([res | s := summary.details[_]; res := s.non_compliant_resources[_]])])
]

# ✅ Build violation message list separately
violations := [
  sprintf("❌ Cluster '%s' has an unauthorized admin user: '%s'", [res.name, res.authorization[0].admin_users[0].username])
  | s := summary.details[_]
  res := s.non_compliant_resources[_]
  res.authorization[0].admin_users[0].username != null
]

# ✅ Final output message with no self-reference
message := array.concat(header, violations)
detail := summary.details
