package terraform.gcp.security.identity_platform.inbound_saml.sp_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_platform.inbound_saml.vars

conditions := [

  # Whitelist: callback_uri must start with https://
  [
    {
      "situation_description": "callback_uri does not start with 'https://', which is required for security.",
      "remedies": [
        "Ensure the callback_uri uses HTTPS for secure communication."
      ]
    },
    {
      "condition": "Ensure callback_uri begins with 'https://'",
      "attribute_path": ["sp_config", "callback_uri"],
      "values": ["^https://.*"],  # Regex to validate secure scheme
      "policy_type": "whitelist"  # Correct usage in your framework
    }
  ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
