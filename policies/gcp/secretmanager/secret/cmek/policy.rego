package terraform.gcp.security.secretmanager.secret.cmek
import data.terraform.gcp.helpers
import data.terraform.gcp.security.secretmanager.secret.vars

conditions := [
  [
    {
      "situation_description": "Secret is not using CMEK (missing or unset kms_key_name)",
      "remedies": ["Specify a valid KMS key under customer_managed_encryption"]
    },
    {
      "condition": "Secret must not omit kms_key_name",
      "attribute_path": ["replication", "auto", 0, "customer_managed_encryption"],
      "values": [{}],  # This catches an empty object
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Secret is using a deprecated or unauthorized KMS key",
      "remedies": ["Use an approved CMEK key instead"]
    },
    {
      "condition": "KMS key is in the blacklist",
      "attribute_path": ["replication", "auto", 0, "customer_managed_encryption", 0, "kms_key_name"],
      "values": [
        "projects/bad-project/locations/global/keyRings/deprecated/cryptoKeys/old-key"
      ],
      "policy_type": "blacklist"
    }
  ]
]




message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
