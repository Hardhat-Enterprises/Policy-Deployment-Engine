package terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.backup_config_encryption_key_gcp_kms_encryption_key
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.vars

conditions := [
  [
    {
      "situation_description": "Backup Plan encryption key must be set.",
      "remedies": ["Ensure encryption key is configured."]
    },
    {
      "condition": "Encryption key must not be empty",
      "attribute_path": ["backup_config", 0, "encryption_key", 0, "gcp_kms_encryption_key"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
