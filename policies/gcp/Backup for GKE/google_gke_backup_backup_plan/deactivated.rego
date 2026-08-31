package terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.deactivated
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.vars

conditions := [
  [
    {
      "situation_description": "Backup Plan must not be deactivated.",
      "remedies": ["Set deactivated to false."]
    },
    {
      "condition": "Deactivated must not be true",
      "attribute_path": ["deactivated"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
