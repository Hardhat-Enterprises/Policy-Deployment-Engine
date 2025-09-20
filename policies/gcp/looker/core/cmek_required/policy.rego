package terraform.gcp.security.looker.core.cmek_required
import data.terraform.gcp.helpers
import data.terraform.gcp.security.looker.core.vars

conditions := [
  [
    {
      "situation_description": "CMEK (Customer-Managed Encryption Key) is required but not configured",
      "remedies": [
        "Configure encryption_config block with kms_key_name",
        "Set kms_key_name to a valid KMS key resource path",
        "Example: projects/PROJECT_ID/locations/LOCATION/keyRings/RING_NAME/cryptoKeys/KEY_NAME"
      ]
    },
    {
      "condition": "encryption_config.kms_key_name must be set",
      "attribute_path": ["encryption_config", 0, "kms_key_name"],
      "values": [null, ""], # Violates when missing or empty
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details