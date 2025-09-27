package terraform.gcp.security.gke_backup.google_gke_backup_backup_plan.encryption_required
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_backup_plan.vars

conditions := [[
  {
    "situation_description": "Backup plan does not have encryption configured",
    "remedies": ["Configure backup_config.encryption_key with a valid GCP KMS key in australia-southeast1"]
  },
  {
    "condition": "backup_config.encryption_key.gcp_kms_encryption_key must be present",
    "attribute_path": ["backup_config", 0, "encryption_key", 0, "gcp_kms_encryption_key"],
    "values": [""],
    "policy_type": "blacklist"
  }
], [
  {
    "situation_description": "Backup retention policy is not properly configured for security",
    "remedies": ["Set backup_delete_lock_days >= 7, backup_retain_days >= 30, locked = true"]
  },
  {
    "condition": "backup_delete_lock_days must be at least 7",
    "attribute_path": ["retention_policy", 0, "backup_delete_lock_days"],
    "values": [7, null],
    "policy_type": "range"
  },
  {
    "condition": "backup_retain_days must be at least 30", 
    "attribute_path": ["retention_policy", 0, "backup_retain_days"],
    "values": [30, null],
    "policy_type": "range"
  },
  {
    "condition": "retention policy must be locked",
    "attribute_path": ["retention_policy", 0, "locked"],
    "values": [true],
    "policy_type": "whitelist"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details