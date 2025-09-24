package terraform.gcp.security.alloydb.google_alloydb_backup.kms_key_name

import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.alloydb.google_alloydb_backup.vars as vars

conditions := [
  [
    {
      "situation_description": "Backup created without CMEK.",
      "remedies": [
        "Set encryption_config.kms_key_name to a valid KMS key self-link.",
        "Ensure the key is in a compatible region and IAM grants allow AlloyDB to use it."
      ]
    },
    {
      "condition": "CMEK must be specified.",
      "attribute_path": ["encryption_config", "kms_key_name"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
