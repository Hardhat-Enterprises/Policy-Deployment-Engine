package terraform.gcp.security.azurenodepool.node_pool.vm_size_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azurenodepool.vars as vars

conditions := [
  {
    "situation_description": "Only approved VM sizes should be used in node pools",
    "remedies": ["Use sizes like Standard_D2s_v3, Standard_E2s_v3, or Standard_DS3_v2"],
    "condition": "C1",
    "attribute_path": ["config", 0, "vm_size"],
    "values": ["Standard_D2s_v3", "Standard_E2s_v3", "Standard_DS3_v2"],
    "policy_type": "whitelist"
  }
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
detail := summary.details
