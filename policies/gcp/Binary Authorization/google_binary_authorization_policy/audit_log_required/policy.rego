package terraform.gcp.security.binary_authorization.google_binary_authorization_policy.audit_log_required

import data.terraform.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_policy.vars

conditions := [
  [
    {
      "situation_description": "Audit logging is not properly configured in Binary Authorization policy",
      "remedies": [
        "Set `default_admission_rule.enforcement_mode` to `ENFORCED_BLOCK_AND_AUDIT_LOG`"
      ]
    },
    {
      "condition": "Audit logging must be enabled in enforcement mode",
      "attribute_path": ["default_admission_rule", 0, "enforcement_mode"],
      "values": ["ENFORCED_BLOCK_AND_AUDIT_LOG"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
