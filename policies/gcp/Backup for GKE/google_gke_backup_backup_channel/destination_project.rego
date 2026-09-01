package terraform.gcp.security.backup_for_gke.google_gke_backup_backup_channel.destination_project
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_backup_channel.vars

conditions := [
  [
    {
      "situation_description": "Destination project must be set.",
      "remedies": ["Ensure destination_project is configured."]
    },
    {
      "condition": "Destination Project must not be empty",
      "attribute_path": ["destination_project"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
