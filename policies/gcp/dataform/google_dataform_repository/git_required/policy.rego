package terraform.gcp.security.dataform.google_dataform_repository.git_required

import data.terraform.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository.vars

# This policy enforces: if a repo configures git_remote_settings,
# then BOTH `url` and `default_branch` must be set (non-empty).
#
# We implement this with two separate situations:
#  - Situation 1: If git_remote_settings exists, URL must be set
#  - Situation 2: If git_remote_settings exists, default_branch must be set

conditions := [
  # ── Situation 1: Git remote URL is required
  [
    {
      "situation_description": "Git remote URL is missing",
      "remedies": [
        "Set git_remote_settings.url to the HTTPS remote (e.g., 'https://github.com/org/repo.git')."
      ]
    },
    {
      "condition": "Git remote is configured",
      "attribute_path": ["git_remote_settings"],
      "policy_type": "blacklist",
      "values": [null, []]
    },
    {
      "condition": "Git remote URL must be set",
      "attribute_path": ["git_remote_settings", 0, "url"],
      "policy_type": "blacklist",
      "values": [null, ""]
    }
  ],

  # ── Situation 2: Git remote default_branch is required
  [
    {
      "situation_description": "Git remote default_branch is missing",
      "remedies": [
        "Set git_remote_settings.default_branch to the repo's default branch (e.g., 'main')."
      ]
    },
    {
      "condition": "Git remote is configured",
      "attribute_path": ["git_remote_settings"],
      "policy_type": "blacklist",
      "values": [null, []]
    },
    {
      "condition": "Git remote default_branch must be set",
      "attribute_path": ["git_remote_settings", 0, "default_branch"],
      "policy_type": "blacklist",
      "values": [null, ""]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details