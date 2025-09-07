package terraform.gcp.security.binary_authorization.google_binary_authorization_policy.default_admission_rule

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_policy.vars

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
      "attribute_path": ["default_admission_rule", "evaluation_mode"],
      "values": ["REQUIRE_ATTESTATION"],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "Default admission rule does not enforce blocking",
      "remedies": [
        "Set enforcement_mode to ENFORCED_BLOCK_AND_AUDIT_LOG"
      ]
    },
    {
      "condition": "Enforcement must block and log",
      "attribute_path": ["default_admission_rule", "enforcement_mode"],
      "values": ["ENFORCED_BLOCK_AND_AUDIT_LOG"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
