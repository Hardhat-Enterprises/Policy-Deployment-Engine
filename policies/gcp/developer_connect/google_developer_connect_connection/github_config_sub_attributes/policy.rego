package terraform.gcp.security.developer_connect.google_developer_connect_connection.github_config_sub_attributes
import data.terraform.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_connection.vars

conditions := [
  [
    {
      "situation_description": "Only the approved GitHub App is allowed",
      "remedies": ["Set github_config.github_app to DEVELOPER_CONNECT"]
    },
    {
      "condition": "GitHub App is not approved",
      "attribute_path": ["github_config", 0, "github_app"],
      "values": ["DEVELOPER_CONNECT"],
      "policy_type": "whitelist"
    }
  ],

  [
    {
      "situation_description": "OAuth token secret must come from approved Secret Manager path",
      "remedies": ["Use projects/pde2025/secrets/github-token-secret/versions/latest"]
    },
    {
      "condition": "Secret version path not approved",
      "attribute_path": ["github_config", 0, "authorizer_credential", 0, "oauth_token_secret_version"],
      "values": ["projects/*/secrets/*/versions/*", [["pde2025"], ["github-token-secret"], ["latest"]]],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
