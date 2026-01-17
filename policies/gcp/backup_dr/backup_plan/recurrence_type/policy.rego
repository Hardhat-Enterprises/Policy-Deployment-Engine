package terraform.gcp.security.backup_dr.backup_plan.recurrence 

import data.terraform.helpers
import data.terraform.gcp.security.backup_dr.backup_plan.vars

# Enforce approved recurrence type(s) for backup plans
# NOTE: Update attribute_path to the exact field name found in plan.json for google_backup_dr_backup_plan
# Common possibilities: ["recurrence","type"] or ["backup_rules",0,"recurrence","type"] etc.

conditions := [
  [
    {
      "situation_description": "Backup plan recurrence type is not approved",
      "remedies": [
        "Update the backup plan recurrence type to an approved value (e.g., DAILY or WEEKLY)"
      ]
    },
    {
      "condition": "Backup plan must use an approved recurrence type",
      "attribute_path": ["recurrence", "type"],
      "values": ["DAILY", "WEEKLY"],
      "policy_type": "whitelist"
    }
  ]
]

# General compliance message
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed debugging output
details := helpers.get_multi_summary(conditions, vars.variables).details

