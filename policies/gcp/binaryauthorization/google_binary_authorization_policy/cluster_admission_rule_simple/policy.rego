package terraform.gcp.security.binary_authorization.google_binary_authorization_policy.cluster_admission_rule_simple

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_policy.vars

conditions := [

  [
    {
      "situation_description": "A cluster admission rule is set to `EVALUATION_MODE_UNSPECIFIED`",
      "remedies": [
        "Set the `evaluation_mode` of all cluster admission rules to a valid value such as `ALWAYS_ALLOW`, `ALWAYS_DENY`, or `REQUIRE_ATTESTATION`"
      ]
    },
    {
      "condition": "`cluster_admission_rules.evaluation_mode` must not be `EVALUATION_MODE_UNSPECIFIED`",
      "attribute_path": ["cluster_admission_rules", 0, "evaluation_mode"],
      "values": ["EVALUATION_MODE_UNSPECIFIED"],
      "policy_type": "blacklist"
    }
  ]

]

# Summary message (high-level pass/fail)
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed per-resource breakdown
details := helpers.get_multi_summary(conditions, vars.variables).details
