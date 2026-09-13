package terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.backup_config_permissive_mode
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.vars

conditions := [
  [
    {
      "situation_description": "Backup Plan must not use permissive mode.",
      "remedies": ["Set backup_config.permissive_mode to false."]
    },
    {
      "condition": "Permissive mode must not be true",
      "attribute_path": ["backup_config", 0, "permissive_mode"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
