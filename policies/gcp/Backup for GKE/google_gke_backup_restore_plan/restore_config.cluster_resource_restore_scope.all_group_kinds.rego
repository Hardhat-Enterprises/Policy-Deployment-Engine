package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_plan.restore_config_cluster_resource_restore_scope_all_group_kinds
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_plan.vars

conditions := [
  [
    {
      "situation_description": "Restore Plan must not restore all cluster resources.",
      "remedies": ["Set all_group_kinds to false and specify selected_group_kinds."]
    },
    {
      "condition": "Cluster resource restore scope must not have all_group_kinds true",
      "attribute_path": ["restore_config", 0, "cluster_resource_restore_scope", 0, "all_group_kinds"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
