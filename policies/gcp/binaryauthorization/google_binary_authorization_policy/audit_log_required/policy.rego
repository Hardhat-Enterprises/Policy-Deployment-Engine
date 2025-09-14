package terraform.gcp.security.binary_authorization.google_binary_authorization_policy.audit_log_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_policy.vars

conditions := [
  [
    {
      "situation_description": "Audit logging is not properly configured in Binary Authorization policy",
      "remedies": [
        "Enable audit logging to track image deployments"
      ]
    },
    {
      "condition": "Audit logging must not be null or empty",
      "attribute_path": ["name_pattern"],  
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
