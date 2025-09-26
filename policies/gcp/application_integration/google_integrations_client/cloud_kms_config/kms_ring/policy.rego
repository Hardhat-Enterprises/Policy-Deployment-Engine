package terraform.gcp.security.application_integration.google_integrations_client.cloud_kms_config.kms_ring

import data.terraform.gcp.helpers
import data.terraform.gcp.security.application_integration.google_integrations_client.vars

# Define the conditions for valid kms_ring
conditions := [
  [
    {
      "situation_description": "KMS Ring must be in an approved list",
      "remedies": ["Use only approved Key Ring names."]
    },
    {
      "condition": "Ensure kms_ring is an approved Key Ring name",
      "attribute_path": ["cloud_kms_config", 0, "kms_ring"],
      "values": ["my-keyring"],  # Approved Key Ring name (this can be expanded if needed)
      "policy_type": "whitelist"
    }
  ]
]

# Generate messages and details for the policy evaluation
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
