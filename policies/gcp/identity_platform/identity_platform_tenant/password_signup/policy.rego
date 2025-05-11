package terraform.gcp.security.identity_platform.tenant.allow_password_signup

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_platform.tenant.vars

conditions := [
  [
    {
      "situation_description": "Password sign-up is disabled for the Identity Platform tenant.",
      "remedies": [
        "Set `allow_password_signup` to true to enable email/password authentication for end users.",
        "This is necessary for user sign-up via Firebase Auth or related services."
      ]
    },
    {
      "condition": "Check if password signup is disabled",
      "attribute_path": ["allow_password_signup"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
