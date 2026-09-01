package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_plan.cluster
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_plan.vars

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

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
