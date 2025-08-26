package terraform.gcp.security.binary_authorization.google_binary_authorization_policy.admission_whitelist_patterns

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_policy.vars

conditions := [

  [
    {
      "situation_description": "Admission whitelist patterns are defined but do not contain a `name_pattern`",
      "remedies": [
        "Ensure that each item in `admission_whitelist_patterns` includes a valid `name_pattern` string"
      ]
    },
    {
      "condition": "`admission_whitelist_patterns` must contain `name_pattern` for each entry",
      "attribute_path": ["admission_whitelist_patterns", 0, "name_pattern"], 
      "values": [null, ""],   # disallow missing or empty name_pattern
      "policy_type": "blacklist"
    }
  ]

]

# Summary message for CI/CD or quick validation
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed breakdown for debugging
details := helpers.get_multi_summary(conditions, vars.variables).details
