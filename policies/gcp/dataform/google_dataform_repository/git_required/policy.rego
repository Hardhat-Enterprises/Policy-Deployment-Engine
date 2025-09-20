package terraform.gcp.security.dataform.google_dataform_repository.git_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository as repo

# This policy enforces: if a repo configures git_remote_settings,
# then BOTH `url` and `default_branch` must be set (non-empty).
#
# We implement this with two situations that use "guards":
#  - If URL is set  -> default_branch must be set
#  - If default_branch is set -> URL must be set
#
# (This avoids false positives when git_remote_settings = [] in the plan.)

conditions := [
  # ── Situation 1: URL present ⇒ default_branch required
  [
    {
      "situation_description": "Git remote URL is configured but default_branch is missing",
      "remedies": [
        "Set git_remote_settings.default_branch to the repo's default branch (e.g., 'main')."
      ]
    },
    {
      "condition": "git_remote_settings must exist",
      "attribute_path": ["git_remote_settings"],
      "policy_type": "blacklist",
      "values": [null, []]
    },
    {
      "condition": "Guard: URL is set",
      "attribute_path": ["git_remote_settings", 0, "url"],
      "policy_type": "whitelist",
      "values": [null, ""]
    },
    {
      "condition": "default_branch must be set",
      "attribute_path": ["git_remote_settings", 0, "default_branch"],
      "policy_type": "blacklist",
      "values": [null, ""]
    }
  ],

  # ── Situation 2: default_branch present ⇒ URL required
  [
    {
      "situation_description": "Git remote default_branch is configured but URL is missing",
      "remedies": [
        "Set git_remote_settings.url to the HTTPS remote (e.g., 'https://github.com/org/repo.git')."
      ]
    },
    {
      "condition": "git_remote_settings must exist",
      "attribute_path": ["git_remote_settings"],
      "policy_type": "blacklist",
      "values": [null, []]
    },
    {
      "condition": "Guard: default_branch is set",
      "attribute_path": ["git_remote_settings", 0, "default_branch"],
      "policy_type": "whitelist",
      "values": [null, ""]
    },
    {
      "condition": "url must be set",
      "attribute_path": ["git_remote_settings", 0, "url"],
      "policy_type": "blacklist",
      "values": [null, ""]
    }
  ]
]

message := helpers.get_multi_summary(conditions, repo.variables).message
details := helpers.get_multi_summary(conditions, repo.variables).details
