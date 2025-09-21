package terraform.gcp.security.dataform.google_dataform_repository.git_https_secret

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository as repo

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
      "policy_type": "whitelist",
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

message := helpers.get_multi_summary(conditions, repo.variables).message
details := helpers.get_multi_summary(conditions, repo.variables).details
