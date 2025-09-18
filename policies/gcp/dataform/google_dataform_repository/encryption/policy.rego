package terraform.gcp.security.dataform.google_dataform_repository.encryption

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository.vars

conditions := [
  [
    {
      "situation_description": "CMEK must be set (kms_key_name cannot be null).",
      "remedies": [
        "Populate kms_key_name with a valid CMEK path.",
        "Ensure key exists in the same/approved region."
      ]
    },
    {
      "condition": "kms_key_name must not be null",
      "attribute_path": ["kms_key_name"],
      "values": [null],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "CMEK must be set (kms_key_name cannot be empty).",
      "remedies": [
        "Populate kms_key_name with a valid CMEK path.",
        "Ensure key exists in the same/approved region."
      ]
    },
    {
      "condition": "kms_key_name must not be empty",
      "attribute_path": ["kms_key_name"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "CMEK key path must match required format.",
      "remedies": [
        "Use projects/*/locations/*/keyRings/*/cryptoKeys/*.",
        "Verify region segment matches repository region."
      ]
    },
    {
      "condition": "kms_key_name must match CMEK resource format",
      "attribute_path": ["kms_key_name"],
      "values": ["projects/*/locations/*/keyRings/*/cryptoKeys/*", [["*"], ["*"], ["*"], ["*"]]],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details