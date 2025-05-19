package terraform.gcp.security.cloud_buildv2.connection.github_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.connection.vars

scenarios_list := [
  [
    {
      "situation_description": "GitHub configuration block must exist",
      "remedies": ["Ensure 'github_config' block is present"]
    },
    {
      "condition": "Missing 'github_config' block",
      "attribute_path": ["github_config"],
      "values": ["pattern:^.+$"],
      "policy_type": "pattern whitelist"
    }
  ],
  [
    {
      "situation_description": "GitHub config must include 'authorizer_credential' block",
      "remedies": ["Ensure 'authorizer_credential' is defined inside 'github_config'"]
    },
    {
      "condition": "Missing 'authorizer_credential' inside GitHub config",
      "attribute_path": ["github_config", "authorizer_credential"],
      "values": ["pattern:^.+$"],
      "policy_type": "pattern whitelist"
    }
  ],
  [
    {
      "situation_description": "'oauth_token_secret_version' must follow approved secret path format",
      "remedies": ["Use secure secret paths like 'projects/.+/secrets/.+/versions/.+'"]
    },
    {
      "condition": "Invalid or unapproved secret version path",
      "attribute_path": ["github_config", "authorizer_credential", "oauth_token_secret_version"],
      "values": ["pattern:^projects/.+/secrets/.+/versions/.+$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)
message := summary.message
details := summary.details
