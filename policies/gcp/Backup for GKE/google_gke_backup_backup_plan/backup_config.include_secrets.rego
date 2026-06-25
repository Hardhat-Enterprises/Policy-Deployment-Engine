package terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.backup_config_include_secrets
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.vars

conditions := [
  [
    {
      "situation_description": "Backup Plan must not include secrets.",
      "remedies": ["Set backup_config.include_secrets to false."]
    },
    {
      "condition": "Include secrets must not be true",
      "attribute_path": ["backup_config", 0, "include_secrets"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
