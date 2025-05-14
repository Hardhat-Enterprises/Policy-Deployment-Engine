package terraform.gcp.security.azurecluster.cluster.azure_region_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azurecluster.vars as vars

conditions := [
  {
    "situation_description": "Azure clusters must be created only in approved regions",
    "remedies": ["Use regions such as australiaeast or australiasoutheast"],
    "condition": "C1",
    "attribute_path": ["azure_region"],
    "values": ["australiaeast", "australiasoutheast", "uswest1"],
    "policy_type": "whitelist"
  }
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
detail := summary.details
