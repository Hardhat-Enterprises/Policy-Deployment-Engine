package terraform.gcp.security.backup_for_gke.restore_plan.cluster
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.restore_plan.vars

conditions := [
  [
    {
      "situation_description": "Restore Plan cluster must be set.",
      "remedies": ["Ensure cluster is configured."]
    },
    {
      "condition": "Cluster must not be empty",
      "attribute_path": ["cluster"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
