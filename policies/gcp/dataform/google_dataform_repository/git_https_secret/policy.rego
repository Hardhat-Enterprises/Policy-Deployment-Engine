package terraform.gcp.security.dataform.google_dataform_repository.git_https_secret

import data.terraform.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository.vars

# Situation: If a Git remote is configured over HTTPS, 
# then an HTTPS token secret must be provided.
#
# This policy ensures that when using HTTPS Git remotes, proper authentication
# is configured via Secret Manager tokens.

conditions := [
  [
    {
      "situation_description": "Git remote configured over HTTPS but authentication token secret is missing",
      "remedies": [
        "Set git_remote_settings.authentication_token_secret_version to a Secret Manager version such as:",
        "projects/<project>/secrets/<name>/versions/<n>"
      ]
    },
    {
      "condition": "Git remote is configured",
      "attribute_path": ["git_remote_settings"],
      "policy_type": "blacklist",
      "values": [null, []]
    },
    {
      "condition": "HTTPS Git remote requires authentication token",
      "attribute_path": ["git_remote_settings", 0, "authentication_token_secret_version"],
      "policy_type": "blacklist",
      "values": [null, ""]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
