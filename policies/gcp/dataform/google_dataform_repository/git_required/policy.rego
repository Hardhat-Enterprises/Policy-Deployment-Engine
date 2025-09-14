package terraform.gcp.security.dataform.google_dataform_repository.git_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository.vars

conditions := [
  [
    {"situation_description": "Git integration must specify a remote URL.",
     "remedies": [
       "Provide git_remote_settings.url.",
       "Use HTTPS or SSH Git repository URL."
     ]},
    {"condition": "Remote URL must not be empty",
     "attribute_path": ["git_remote_settings", 0, "url"],
     "values": [null, ""],
     "policy_type": "blacklist"}
  ],
  [
    {"situation_description": "Git integration must specify a default branch.",
     "remedies": [
       "Set git_remote_settings.default_branch (e.g., main).",
       "Ensure the branch exists in the repository."
     ]},
    {"condition": "Default branch must not be empty",
     "attribute_path": ["git_remote_settings", 0, "default_branch"],
     "values": [null, ""],
     "policy_type": "blacklist"}
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
