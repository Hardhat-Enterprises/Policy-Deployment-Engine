package terraform.gcp.security.azurecluster.cluster.fleet_project_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azurecluster.vars as vars

conditions := [
  {
    "situation_description": "Clusters must only be linked to approved fleet projects",
    "remedies": ["Use fleet.project like chrome-ability-456100-t1 or secure-fleet-prod"],
    "condition": "C1",
    "attribute_path": ["fleet", 0, "project"],
    "values": ["chrome-ability-456100-t1", "secure-fleet-prod", "shared-core-network"],
    "policy_type": "whitelist"
  }
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
detail := summary.details
