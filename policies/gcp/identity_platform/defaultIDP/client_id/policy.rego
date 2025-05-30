package terraform.gcp.security.identity_platform.default_supported_idp_config.client_id_check

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_platform.default_supported_idp_config.vars

conditions := [

  # Pattern Whitelist: Enforce that client_id is defined and matches expected Google OAuth pattern
  [
    {
      "situation_description": "The OAuth client_id is missing or incorrectly formatted. This may lead to identity federation issues.",
      "remedies": [
        "Ensure 'client_id' is defined.",
        "Use a valid Google OAuth client ID (e.g., ends with .apps.googleusercontent.com)."
      ]
    },
    {
      "condition": "client_id must match Google OAuth format",
      "attribute_path": ["client_id"],
      "values": [
        "*",  # Target the entire string
        [["^[a-zA-Z0-9-_]+\\.apps\\.googleusercontent\\.com$"]]  # Allowed pattern for Google OAuth client ID
      ],
      "policy_type": "pattern whitelist"
    }
  ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
