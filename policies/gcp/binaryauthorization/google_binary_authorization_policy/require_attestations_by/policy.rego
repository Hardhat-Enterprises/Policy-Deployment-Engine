package terraform.gcp.security.binary_authorization.google_binary_authorization_policy.require_attestations_by

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_policy.vars

conditions := [
  [
    {
      "situation_description": "No attestors defined in default admission rule",
      "remedies": [
        "Add at least one attestor under default_admission_rule.require_attestations_by"
      ]
    },
    {
      "condition": "Must define one or more attestors",
      "attribute_path": ["default_admission_rule", "require_attestations_by"],
      "values": [null, []],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details