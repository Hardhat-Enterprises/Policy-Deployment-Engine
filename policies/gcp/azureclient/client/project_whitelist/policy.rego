package terraform.gcp.security.azureclient.client.project_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azureclient.vars as vars

conditions := [
  {
    "situation_description": "Azure Clients must belong to an approved GCP project",
    "remedies": ["Use only approved project names like chrome-ability-456100-t1"],
    "condition": "C1",
    "attribute_path": ["project"],
    "values": ["chrome-ability-456100-t1", "secure-infra-001", "prod-core-999"],
    "policy_type": "whitelist"
  }
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
detail := summary.details
