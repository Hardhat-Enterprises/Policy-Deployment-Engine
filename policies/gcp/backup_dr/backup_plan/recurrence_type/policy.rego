package terraform.gcp.security.backup_dr.backup_plan.recurrence 

import data.terraform.helpers
import data.terraform.gcp.security.backup_dr.backup_plan.vars

conditions := [
  [
    {
      "situation_description": "Recurrence_type is not compliant.",
      "remedies": [
        "Set Recurrence type to DAILY or WEEKLY"
      ]},
    {
      "condition": "Configure approved recurrence type",
      "attribute_path": ["recurrence", "type"],
      "values": ["DAILY", "WEEKLY"],
      "policy_type": "whitelist"
    }
  ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

