package terraform.gcp.security.backup_dr.backup_vault.access_restriction

import data.terraform.helpers
import data.terraform.gcp.security.backup_dr.backup_vault.vars

conditions := [
  [
    {
      "situation_description": "Access_restriction is not compliant.",
      "remedies": [
        "Set Access_restriction to WITHIN_ORGANIZATION only"
      ] },
    {
      "condition": "Restrict Access within the organization only",
      "attribute_path": ["access_restriction"],
      "values": ["WITHIN_ORGANIZATION"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
