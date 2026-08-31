package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_plan.restore_config_all_namespaces
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_plan.vars

conditions := [
  [
    {
      "situation_description": "Restore Plan must not restore all namespaces.",
      "remedies": ["Set restore_config.all_namespaces to false or specify selected_namespaces."]
    },
    {
      "condition": "Restore config must not have all_namespaces set to true",
      "attribute_path": ["restore_config", 0, "all_namespaces"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
