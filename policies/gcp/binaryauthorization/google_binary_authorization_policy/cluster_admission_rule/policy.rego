package terraform.gcp.security.binary_authorization.google_binary_authorization_policy.cluster_admission_rule

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_policy.vars

conditions := [
  [
    {
      "situation_description": "Default admission rule allows all images (ALWAYS_ALLOW)",
      "remedies": [
        "Set `evaluation_mode` to REQUIRE_ATTESTATION for secure cluster admission"
      ]
    },
    {
      "condition": "Default admission rule must not be set to ALWAYS_ALLOW",
      "attribute_path": ["default_admission_rule", "evaluation_mode"],
      "values": ["ALWAYS_ALLOW"],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Admission whitelist pattern is empty or null",
      "remedies": [
        "Provide a valid `name_pattern` to whitelist trusted images"
      ]
    },
    {
      "condition": "name_pattern must not be empty or null",
      "attribute_path": ["admission_whitelist_patterns", 0, "name_pattern"],
      "values": ["", null],
      "policy_type": "blacklist"
    }
  ]
]

# Generate summary message and details
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
