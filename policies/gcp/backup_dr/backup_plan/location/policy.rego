package terraform.gcp.security.backup_dr.backup_plan.location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.backup_dr.backup_plan.vars

conditions := [
  [
    {
      "situation_description": "Backup plan is created in an unapproved region",
      "remedies": [
        "Update the backup plan location to an approved region (australia-southeast1 or australia-southeast2)"
      ]
    },
    {
      "condition": "Backup plan must be created in an approved region",
      "attribute_path": ["location"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
