package terraform.gcp.security.cloud_buildv2.connection.oauth_token_secret_version

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.connection.vars

scenarios_list := [
  [
    {
      "situation_description": "OAuth token must be fetched from an approved secrets path",
      "remedies": ["Ensure 'oauth_token_secret_version' follows the pattern: projects/demo/secrets/github-token/versions/*"]
    },
    {
      "condition": "OAuth token secret path is not in the approved format",
      "attribute_path": ["github_config", 0, "authorizer_credential", 0, "oauth_token_secret_version"],
      "values": ["pattern:projects/demo/secrets/github-token/versions/.*"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)
message := summary.message
details := summary.details
