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
  ],
  [
    {
      "situation_description": "Location must follow valid GCP region format.",
      "remedies": ["Ensure location matches regex '^[a-z]+-[a-z]+\\d$'."]
    },
    {
      "condition": "Location must match valid region format",
      "attribute_path": ["location"],
      "values": ["^[a-z]+-[a-z]+\\d$"],
      "policy_type": "pattern_whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
