package terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.backup_config_selected_applications_namespaced_names_namespace
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.vars

conditions := [
  [
    {
      "situation_description": "Selected application name must not be empty.",
      "remedies": ["Specify a valid application name."]
    },
    {
      "condition": "Selected application name must not be empty",
      "attribute_path": ["backup_config", 0, "selected_applications", 0, "namespaced_names", 0, "name"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
