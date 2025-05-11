package terraform.gcp.security.identity_platform.tenant.enable_email_link_signin_check

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_platform.tenant.vars

conditions := [
  [
    {
      "situation_description": "Email link sign-in is disabled for this tenant.",
      "remedies": [
        "Set 'enable_email_link_signin' to true to support passwordless authentication flows."
      ]
    },
    {
      "condition": "Ensure email link sign-in is enabled",
      "attribute_path": ["enable_email_link_signin"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details