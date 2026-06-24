package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_plan.restore_config_excluded_namespaces_namespaces
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_plan.vars

conditions := [
  [
    {
      "situation_description": "Critical system namespaces must not be excluded from restoration.",
      "remedies": ["Remove 'kube-system' and 'gatekeeper-system' from excluded_namespaces."]
    },
    {
      "condition": "Excluded namespaces must not contain system critical namespaces",
      "attribute_path": ["restore_config", 0, "excluded_namespaces", 0, "namespaces"],
      "values": ["kube-system", "gatekeeper-system"],
      "policy_type": "element_blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
