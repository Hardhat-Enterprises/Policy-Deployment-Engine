package terraform.gcp.security.developer_connect.google_developer_connect_connection.restrict_secret_version_path
import data.terraform.gcp.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_connection.vars

# Enforce Secret Manager path: project/org + allowed secret + version
conditions := [
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
