package terraform.gcp.security.binary_authorization.google_binary_authorization_policy.audit_log_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_policy.vars

conditions := [
  [
    {
      "situation_description": "Audit logging is not properly configured in Binary Authorization policy",
      "remedies": [
        "Add `audit_log_config` with `log_type` set to `ALL`"
      ]
    },
    {
      "condition": "`audit_log_config` must be defined",
      "attribute_path": ["name_pattern"],
      "values": [null, []],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
