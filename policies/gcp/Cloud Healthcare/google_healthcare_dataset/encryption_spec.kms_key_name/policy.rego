package terraform.gcp.security.cloud_healthcare.google_healthcare_dataset.encryption_spec_kms_key_name

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_dataset.vars

conditions := [
  [
    {
      "situation_description": "Healthcare Dataset does not have CMEK encryption configured — uses Google-managed keys only",
      "remedies": [
        "Add an encryption_spec block with a valid KMS key name",
        "Example: encryption_spec { kms_key_name = \"projects/PROJECT/locations/REGION/keyRings/RING/cryptoKeys/KEY\" }"
      ]
    },
    {
      "condition":      "Check if encryption_spec kms_key_name is not null",
      "attribute_path": ["encryption_spec", 0, "kms_key_name"],
      "values":         [null, ""],
      "policy_type":    "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
