package terraform.gcp.security.application_integration.google_integrations_client.cloud_kms_config.key

import data.terraform.gcp.helpers
import data.terraform.gcp.security.application_integration.google_integrations_client.vars

conditions := [
  [
    {
      "situation_description": "KMS Key must be from an approved list",
      "remedies": ["Use only approved keys for KMS"]
    },
    {
      "condition": "Ensure key is from the approved key whitelist",
      "attribute_path": ["cloud_kms_config", 0, "key"],
      "values": ["crypto_key"],  # Add your allowed key names here, increse if needed
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
