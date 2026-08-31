package terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.backup_config_all_namespaces
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.vars

conditions := [
  [
    {
      "situation_description": "Backup Plan must not backup all namespaces.",
      "remedies": ["Set backup_config.all_namespaces to false or specify selected_namespaces."]
    },
    {
      "condition": "Backup config must not have all_namespaces set to true",
      "attribute_path": ["backup_config", 0, "all_namespaces"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
