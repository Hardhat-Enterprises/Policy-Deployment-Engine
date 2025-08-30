package terraform.gcp.security.alloydb.google_alloydb_backup.kms_key_name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_backup.vars

# Same structure as your user_id policy: conditions -> helpers.get_multi_summary(...)
conditions := [
  [
    {
      "situation_description": "Backup is not encrypted with a customer-managed key (CMEK).",
      "remedies": [
        "Set encryption_config.kms_key_name to a valid Cloud KMS CryptoKey.",
        "Use a key in an approved project/region as per org standards."
      ]
    },
    {
      "condition": "CMEK must be configured",
      "attribute_path": ["encryption_config"],
      "values": [[]],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
