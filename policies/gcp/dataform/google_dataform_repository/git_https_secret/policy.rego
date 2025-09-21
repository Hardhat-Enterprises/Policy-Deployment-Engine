package terraform.gcp.security.dataform.google_dataform_repository.git_https_secret

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository as repo

# Situation: If a Git remote is configured AND SSH auth is NOT used,
# then an HTTPS token secret must be provided.
#
# Guards:
#  - Guard A (remote configured): git_remote_settings NOT in [null, []]
#    -> Use whitelist [null, []] so violation happens only when value is not in that set.
#  - Guard B (HTTPS path): ssh_authentication_config is absent/empty (i.e., not SSH)
#    -> whitelist [null, []] on that nested block array.
# Requirement:
#  - authentication_token_secret_version must be set (not null/empty)

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
      "condition": "Guard A: remote is configured (array has an element)",
      "attribute_path": ["git_remote_settings"],
      "policy_type": "whitelist",
      "values": [null, []]
    },
    {
      "condition": "Guard B: SSH auth NOT used",
      "attribute_path": ["git_remote_settings", 0, "ssh_authentication_config"],
      "policy_type": "whitelist",
      "values": [null, []]
    },
    {
      "condition": "HTTPS token secret must be set",
      "attribute_path": ["git_remote_settings", 0, "authentication_token_secret_version"],
      "policy_type": "blacklist",
      "values": [null, ""]
    }
  ]
]

message := helpers.get_multi_summary(conditions, repo.variables).message
details := helpers.get_multi_summary(conditions, repo.variables).details
