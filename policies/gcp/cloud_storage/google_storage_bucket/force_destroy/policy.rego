package terraform.gcp.security.cloud_storage.google_storage_bucket.force_destroy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage.google_storage_bucket.vars


conditions := [
  [
    {
      "situation_description": "Bucket has force_destroy enabled, which can lead to unintended data deletion.",
      "remedies": [
        "Set force_destroy to false to prevent accidental bucket deletion."
      ]
    },
    {
      "condition": "force_destroy should be false for safe deletion practices.",
      "attribute_path": ["force_destroy"],
      "values": [true],  # Disallowed value
      "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

# Message summary
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed condition-wise results
details := helpers.get_multi_summary(conditions, vars.variables).details
