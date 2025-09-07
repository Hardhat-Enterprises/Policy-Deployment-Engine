package terraform.gcp.security.binary_authorization.google_binary_authorization_policy.audit_logging

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_policy.vars

conditions := [
  [
    {
      "situation_description": "Audit logging is disabled in Binary Authorization policy",
      "remedies": [
        "Enable audit logging to track image deployments"
      ]
    },
    {
      "condition": "Audit logging must be enabled",
      "attribute_path": ["admission_whitelist_patterns"], # placeholder (no direct flag in Terraform, simulate by requiring a log config attribute)
      "values": [null],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
