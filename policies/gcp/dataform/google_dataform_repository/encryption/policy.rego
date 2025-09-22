package terraform.gcp.security.dataform.google_dataform_repository.encryption

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository as repo

# Require CMEK on repositories (kms_key_name must be set)

conditions := [
  [
    {
      "situation_description": "CMEK must be enabled for Dataform repositories",
      "remedies": [
        "Set kms_key_name to a valid Cloud KMS key resource path",
        "Use a regional key matching the repository region"
      ]
    },
    {
      "condition": "kms_key_name is required",
      "attribute_path": ["kms_key_name"],
      "policy_type": "blacklist",
      "values": [null, ""]
    }
  ]
]

message := helpers.get_multi_summary(conditions, repo.variables).message
details := helpers.get_multi_summary(conditions, repo.variables).details