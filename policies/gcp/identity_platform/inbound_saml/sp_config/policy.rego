package terraform.gcp.security.identity_platform.inbound_saml.sp_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_platform.inbound_saml.vars

conditions := [

  # callback_uri must start with https:// if provided
  [
    {
      "situation_description": "callback_uri does not start with 'https://', which is required for security.",
      "remedies": [
        "Ensure the callback_uri uses HTTPS for secure communication."
      ]
    },
    {
      "condition": "Check that callback_uri starts with 'https://'",
      "attribute_path": ["sp_config", "callback_uri"],
      "values": ["^https://.*"],
      "policy_type": "pattern whitelist"
    }
  ]

  # Note: sp_entity_id and sp_certificates are optional and not enforced here.
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details