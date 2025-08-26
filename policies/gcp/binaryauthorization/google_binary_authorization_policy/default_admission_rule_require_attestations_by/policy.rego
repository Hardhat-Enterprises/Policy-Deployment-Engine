package terraform.gcp.security.binary_authorization.google_binary_authorization_policy.default_admission_rule_require_attestations_by

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_policy.vars

conditions := [

  [
    {
      "situation_description": "Default admission rule does not specify any attestors in `require_attestations_by`",
      "remedies": [
        "Add at least one attestor reference under `default_admission_rule.require_attestations_by`"
      ]
    },
    {
      "condition": "`default_admission_rule.require_attestations_by` must not be empty",
      "attribute_path": ["default_admission_rule", "require_attestations_by"],
      "values": [null, []],    # disallow null or empty list
      "policy_type": "blacklist"
    }
  ]

]

# High-level summary message
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed per-resource breakdown
details := helpers.get_multi_summary(conditions, vars.variables).details
