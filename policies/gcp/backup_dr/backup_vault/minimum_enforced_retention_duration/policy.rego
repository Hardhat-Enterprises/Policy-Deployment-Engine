package terraform.gcp.security.backup_dr.backup_vault.minimum_enforced_retention_duration

import data.terraform.helpers
import data.terraform.gcp.security.backup_dr.backup_vault.vars

conditions := [
  [
    {
      "situation_description": "Minimum enforced retention duration is not compliant.",
      "remedies": [
        "Set Minimum_enforced_retention_duration at least to 100000s"
      ] },
    {
      "condition": "Check minimum retention duration",
      "attribute_path": ["backup_minimum_enforced_retention_duration"],
      "values": ["100000s"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
