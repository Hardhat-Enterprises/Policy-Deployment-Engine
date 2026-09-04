package terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.retention_policy_locked

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.vars

conditions := [
  [
    {
      "situation_description": "Backup Plan retention policy must be locked to prevent further modification.",
      "remedies": ["Set retention_policy.locked to true."]
    },
    {
      "condition": "Retention policy must be locked",
      "attribute_path": ["retention_policy", 0, "locked"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
