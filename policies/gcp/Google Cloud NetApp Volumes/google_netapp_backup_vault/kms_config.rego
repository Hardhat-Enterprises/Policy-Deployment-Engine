package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup_vault.kms_config

import data.terraform.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup_vault.vars

conditions := [
  [
    {
      "situation_description": "The NetApp backup vault does not have a customer-managed encryption key (CMEK) configuration.",
      "remedies": [
        "Set 'kms_config' to a valid NetApp KMS configuration resource.",
        "Use format: projects/{project}/locations/{location}/kmsConfigs/{name}"
      ]
    },
    {
      "condition": "kms_config is null or empty - CMEK is not configured.",
      "attribute_path": ["kms_config"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details