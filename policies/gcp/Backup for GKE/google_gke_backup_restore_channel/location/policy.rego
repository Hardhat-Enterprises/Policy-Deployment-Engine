package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.location
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.vars

conditions := [
  [
    {
      "situation_description": "GKE Restore Channels must be located in approved regions.",
      "remedies": ["Set the location to 'australia-southeast1' or 'australia-southeast2'."]
    },
    {
      "condition": "Location must be in australia-southeast",
      "attribute_path": ["location"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
