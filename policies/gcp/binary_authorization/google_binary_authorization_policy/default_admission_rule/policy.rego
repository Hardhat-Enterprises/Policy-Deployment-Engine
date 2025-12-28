package terraform.gcp.security.binary_authorization.google_binary_authorization_policy.default_admission_rule

import data.terraform.helpers
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
      "attribute_path": ["default_admission_rule", 0, "evaluation_mode"],
      "values": ["REQUIRE_ATTESTATION"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details