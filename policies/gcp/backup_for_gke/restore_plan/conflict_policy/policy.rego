package terraform.gcp.security.backup_for_gke.restore_plan.conflict_policy
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.restore_plan.vars

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

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
