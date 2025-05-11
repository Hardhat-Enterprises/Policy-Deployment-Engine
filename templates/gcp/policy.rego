package terraform.gcp.security.identity_platform.config.multi_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_platform.config.vars

conditions := [

  #Whitelist: Allow only if anonymous sign-in is disabled
  [
    {
      "situation_description": "Anonymous user access is enabled, which may lead to unauthorized usage.",
      "remedies": [
        "Set 'anonymous.enabled' to false"
      ]
    },
    {
      "condition": "Ensure anonymous sign-in is disabled",
      "attribute_path": ["sign_in", "anonymous", "enabled"],
      "values": [false],
      "policy_type": "whitelist"
    }
  ],

  #Blacklist: Explicitly disallow anonymous sign-in enabled
  [
    {
      "situation_description": "Anonymous sign-in is explicitly enabled, which is prohibited.",
      "remedies": [
        "Remove or disable anonymous sign-in"
      ]
    },
    {
      "condition": "Block anonymous sign-in if explicitly set to true",
      "attribute_path": ["sign_in", "anonymous", "enabled"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ],

  #Range: Ensure session timeout is at least 15 minutes (example)
  [
    {
      "situation_description": "Session timeout is too short, which may reduce security.",
      "remedies": [
        "Set session timeout to at least 900 seconds (15 minutes)"
      ]
    },
    {
      "condition": "Check if session timeout is >= 900",
      "attribute_path": ["monitoring", "session_length_seconds"],  # Hypothetical path
      "values": [900, null],
      "policy_type": "range"
    }
  ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
