package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_plan.restore_config_cluster_resource_conflict_policy
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_plan.vars

conditions := [
  [
    {
      "situation_description": "Restore Plan conflict policy must be USE_EXISTING_VERSION.",
      "remedies": ["Set cluster_resource_conflict_policy to USE_EXISTING_VERSION."]
    },
    {
      "condition": "Conflict policy must be USE_EXISTING_VERSION",
      "attribute_path": ["restore_config", 0, "cluster_resource_conflict_policy"],
      "values": ["USE_EXISTING_VERSION"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
