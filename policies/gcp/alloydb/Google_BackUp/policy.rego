package terraform.gcp.security.alloydb.google_alloydb_backup.backup

import data.terraform.gcp.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_backup.vars

conditions := [
  [
    {
      "situation_description": "Backup is not encrypted with a customer-managed key (CMEK).",
      "remedies": ["Set encryption_config.kms_key_name to a valid Cloud KMS CryptoKey."]
    },
    {
      "condition": "CMEK must be configured",
      "attribute_path": ["encryption_config", "kms_key_name"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Backup location is not in the approved regions.",
      "remedies": ["Use one of the approved locations."]
    },
    {
      "condition": "location must be approved",
      "attribute_path": ["location"],
      "values": ["us-central1", "us-east1", "us-west1", "europe-west1"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
