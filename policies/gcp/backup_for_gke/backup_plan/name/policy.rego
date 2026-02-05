package terraform.gcp.security.backup_for_gke.backup_plan.name
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.backup_plan.vars

conditions := [
  [
    {
      "situation_description": "Backup Plan name must follow the naming convention.",
      "remedies": ["Name must start with 'gke-backup-plan-'."]
    },
    {
      "condition": "Name must start with gke-backup-plan-",
      "attribute_path": ["name"],
      "values": ["^gke-backup-plan-.*$"],
      "policy_type": "pattern_whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
