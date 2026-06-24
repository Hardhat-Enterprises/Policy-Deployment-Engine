package terraform.gcp.security.binary_authorization.google_binary_authorization_policy.default_admission_rule_evaluation_mode

import data.terraform.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_policy.vars

# Merged policy for `default_admission_rule.evaluation_mode` — 2 independent scenarios.
conditions := [
[
    {
      "situation_description": "Default admission rule is too permissive",
      "remedies": [
        "Set evaluation_mode to REQUIRE_ATTESTATION",
        "Set enforcement_mode to ENFORCED_BLOCK_AND_AUDIT_LOG"
      ]
    },
    {
      "condition": "Require attestations and enforce blocking",
      "attribute_path": ["default_admission_rule", 0, "evaluation_mode"],
      "values": ["REQUIRE_ATTESTATION"],
      "policy_type": "whitelist"
    }
  ],
[
    {
      "situation_description": "Default admission rule allows all images (ALWAYS_ALLOW)",
      "remedies": [
        "Set `evaluation_mode` to REQUIRE_ATTESTATION for secure cluster admission"
      ]
    },
    {
      "condition": "Default admission rule must not be set to ALWAYS_ALLOW",
      "attribute_path": ["default_admission_rule", 0,"evaluation_mode"],
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

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
