package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_plan.restore_config_namespaced_resource_restore_mode

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_plan.vars

conditions := [
  [
    {
      "situation_description": "Namespaced resource restore mode must fail on conflicts to prevent existing resources from being overwritten.",
      "remedies": [
        "Set restore_config.namespaced_resource_restore_mode to FAIL_ON_CONFLICT."
      ]
    },
    {
      "condition": "Namespaced resource restore mode must be FAIL_ON_CONFLICT.",
      "attribute_path": ["restore_config", 0, "namespaced_resource_restore_mode"],
      "values": ["FAIL_ON_CONFLICT"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details