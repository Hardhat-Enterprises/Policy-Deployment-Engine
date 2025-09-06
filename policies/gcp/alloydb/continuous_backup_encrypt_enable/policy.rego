package terraform.gcp.security.alloydb.google_alloydb_backup.backup

import data.terraform.gcp.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_backup.vars

# Same pattern as user_id: conditions -> helpers.get_multi_summary(...)
conditions := [
  [
    {
      "situation_description": "Backup is not encrypted with a customer-managed key (CMEK).",
      "remedies": [
        "Set encryption_config.kms_key_name to a valid Cloud KMS CryptoKey.",
        "Use an approved project/region for the key."
      ]
    },
    {
      "condition": "CMEK must be configured",
      "attribute_path": ["encryption_config", 0, "kms_key_name"],
      "policy_type": "blacklist",
      "values": [null, ""]
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
