package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_plan.restore_config_namespaced_resource_restore_mode
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_plan.vars

conditions := [
  [
    {
      "situation_description": "Restore Plan namespaced resource restore mode must be valid.",
      "remedies": ["Set namespaced_resource_restore_mode to DELETE_AND_RESTORE or FAIL_ON_CONFLICT."]
    },
    {
      "condition": "Namespaced resource restore mode must be valid",
      "attribute_path": ["restore_config", 0, "namespaced_resource_restore_mode"],
      "values": ["DELETE_AND_RESTORE", "FAIL_ON_CONFLICT"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
