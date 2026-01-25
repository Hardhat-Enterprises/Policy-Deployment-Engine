package terraform.gcp.security.backup_for_gke.backup_plan.description
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.backup_plan.vars

conditions := [
  [
    {
      "situation_description": "Backup Plan description must be set.",
      "remedies": ["Set the description."]
    },
    {
      "condition": "Description must not be empty or null",
      "attribute_path": ["description"],
      "values": ["", null],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
