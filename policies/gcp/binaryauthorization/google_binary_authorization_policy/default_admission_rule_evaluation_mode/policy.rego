package terraform.gcp.security.binary_authorization.google_binary_authorization_policy.default_admission_rule_evaluation_mode

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_policy.vars

conditions := [

  [
    {
      "situation_description": "Default admission rule does not require attestations",
      "remedies": [
        "Set the `default_admission_rule.evaluation_mode` to `REQUIRE_ATTESTATIONS_FOR_IMAGES`"
      ]
    },
    {
      "condition": "`default_admission_rule.evaluation_mode` must be `REQUIRE_ATTESTATIONS_FOR_IMAGES`",
      "attribute_path": ["default_admission_rule", "evaluation_mode"],
      "values": ["REQUIRE_ATTESTATIONS_FOR_IMAGES"],
      "policy_type": "whitelist"
    }
  ]

]

# High-level compliance message
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed per-resource breakdown
details := helpers.get_multi_summary(conditions, vars.variables).details
