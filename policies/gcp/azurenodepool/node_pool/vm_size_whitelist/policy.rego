package terraform.gcp.security.azurenodepool.node_pool.vm_size_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azurenodepool.node_pool.vm_size_whitelist.vars

approved_vm_sizes := ["Standard_D2s_v3", "Standard_E2s_v3", "Standard_DS3_v2"]

scenarios_list := [
  {
    "situation_description": "⚙️ VM size must be one of the approved configurations for production workloads",
    "remedies": ["✅ Use a vm_size like Standard_D2s_v3 or Standard_E2s_v3"],
    "condition": "C1: Unapproved VM size selected",
    "attribute_path": ["config", 0, "vm_size"],
    "values": approved_vm_sizes,
    "policy_type": "whitelist"
  }
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

# 🖥️ Compatibility check format
header := [
  "🖥️ Node Pool VM Size Compatibility Report",
  "───────────────────────────────────────────────",
  sprintf("🔍 Node pools reviewed: %v", [count(vars.variables)]),
  sprintf("🚨 Incompatible VM sizes found: %v", [count([res | s := summary.details[_]; res := s.non_compliant_resources[_]])])
]

violations := [
  sprintf("❌ Node pool '%s' uses disallowed vm_size: '%s'", [res.name, res.config[0].vm_size])
  | s := summary.details[_]
  res := s.non_compliant_resources[_]
  res.config[0].vm_size != null
]

message := array.concat(header, violations)
detail := summary.details
