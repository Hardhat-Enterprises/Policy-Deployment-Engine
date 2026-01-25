package terraform.gcp.security.backup_dr.backup_plan.recurrence_type

import data.terraform.helpers
import data.terraform.gcp.security.backup_dr.backup_plan.vars

conditions := [
  [
    {
      "situation_description": "recurrence_type is not compliant.",
      "remedies": [
        "set recurrence type to DAILY or WEEKLY"
      ]},
    {
      "condition": "Configure approved recurrence type",
      "attribute_path": ["backup_rules", 0, "standard_schedule", 0, "recurrence_type"],

      "values": ["DAILY", "WEEKLY"],
      "policy_type": "whitelist"
    }
  ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

