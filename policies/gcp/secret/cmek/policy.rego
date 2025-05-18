package terraform.gcp.security.secret.cmek

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secret.vars

conditions := [
  [
    {
      "situation_description": "Secret is not using CMEK (missing or unset kms_key_name)",
      "remedies": ["Specify a valid KMS key under customer_managed_encryption"]
    },
    {
      "condition": "Secret must not omit kms_key_name",
      "attribute_path": ["replication", 0, "auto", 0, "customer_managed_encryption", 0, "kms_key_name"],
      "values": [""],  # Catch empty string = unset
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Secret is not using an approved CMEK key",
      "remedies": ["Use only keys approved by your security team"]
    },
    {
      "condition": "KMS key must be whitelisted",
      "attribute_path": ["replication", 0, "auto", 0, "customer_managed_encryption", 0, "kms_key_name"],
      "values": [
        "projects/premium-trainer-456719-j3/locations/global/keyRings/my-kr/cryptoKeys/my-key"
      ],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
