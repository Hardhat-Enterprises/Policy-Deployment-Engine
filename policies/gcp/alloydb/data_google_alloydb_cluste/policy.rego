package terraform.gcp.security.alloydb.google_alloydb_cluster.continuous_backup_enabled

import data.terraform.gcp.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_cluster.vars

# Two security checks:
#  - S1: Continuous backup must be enabled
#  - S2: Continuous backup must use CMEK (kms_key_name set)

conditions := [
  # S1: must be enabled
  [
    {
      "situation_description": "Continuous backup is disabled on the cluster.",
      "remedies": [
        "Set continuous_backup_config.enabled = true to allow point-in-time recovery."
      ]
    },
    {
      "condition": "Continuous backup must be enabled",
      "attribute_path": ["continuous_backup_config", 0, "enabled"],
      "policy_type": "blacklist",
      "values": [false, null]
    }
  ],

  # S2: must use CMEK
  [
    {
      "situation_description": "Continuous backups are not encrypted with a customer-managed key (CMEK).",
      "remedies": [
        "Set continuous_backup_config.encryption_config.kms_key_name to a valid Cloud KMS CryptoKey."
      ]
    },
    {
      "condition": "CMEK must be configured for continuous backups",
      "attribute_path": ["continuous_backup_config", 0, "encryption_config", 0, "kms_key_name"],
      "policy_type": "blacklist",
      "values": [null, ""]
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
