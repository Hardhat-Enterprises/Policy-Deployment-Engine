package terraform.gcp.security.cloud_buildv2.connection.github_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.connection.vars

scenarios_list := [
  # Scenario 1: GitHub config block must be defined
  [
    {
      "situation_description": "The GitHub config block must be defined",
      "remedies": ["Ensure 'github_config' block is present in your Terraform configuration."]
    },
    {
      "condition": "Missing or undefined GitHub configuration",
      "attribute_path": ["github_config"],
      "values": ["defined"],
      "policy_type": "whitelist"
    }
  ],
  # Scenario 2: GitHub config block must include a valid 'authorizer_credential'
  [
    {
      "situation_description": "The GitHub config block must include a valid 'authorizer_credential'",
      "remedies": ["Ensure 'authorizer_credential' is defined in the GitHub config block."]
    },
    {
      "condition": "Missing or invalid authorizer_credential in GitHub config",
      "attribute_path": ["github_config", 0, "authorizer_credential"],
      "values": ["defined"],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "The GitHub config block must include a valid 'oauth_token_secret_version'",
      "remedies": ["Ensure 'oauth_token_secret_version' is defined in the authorizer_credential block."]
    },
    {
      "condition": "Missing or invalid oauth_token_secret_version in authorizer_credential",
      "attribute_path": ["github_config", 0, "authorizer_credential", 0, "oauth_token_secret_version"],
      "values": ["defined"],
      "policy_type": "whitelist"
    }
  ],
  # Scenario 3: OAuth token secret version must be from an approved location
  [
    {
      "situation_description": "OAuth token secret version must be from an approved location",
      "remedies": ["Use only approved oauth_token_secret_version paths"]
    },
    {
      "condition": "Invalid oauth_token_secret_version value",
      "attribute_path": ["github_config", 0, "authorizer_credential", 0, "oauth_token_secret_version"],
      "values": ["projects/demo/secrets/github-token/versions/1"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

message := summary.message
details := summary.details
