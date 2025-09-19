package terraform.gcp.security.dataform.google_dataform_repository.git_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository.vars

conditions := [
  [
    {
      "situation_description": "Dataform repository must have git_remote_settings configured.",
      "remedies": [
        "Configure git_remote_settings for the repository.",
        "Ensure proper Git integration is set up."
      ]
    },
    {
      "condition": "git_remote_settings must not be null",
      "attribute_path": ["git_remote_settings"],
      "values": [null],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Dataform repository git_remote_settings must have url.",
      "remedies": [
        "Set url in git_remote_settings.",
        "Use valid Git repository URL."
      ]
    },
    {
      "condition": "url must not be null",
      "attribute_path": ["url"],
      "values": [null],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Dataform repository git_remote_settings url cannot be empty.",
      "remedies": [
        "Set url to a non-empty value.",
        "Use valid Git repository URL."
      ]
    },
    {
      "condition": "url must not be empty",
      "attribute_path": ["url"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Dataform repository git_remote_settings must have default_branch.",
      "remedies": [
        "Set default_branch in git_remote_settings.",
        "Use appropriate branch name like main or master."
      ]
    },
    {
      "condition": "default_branch must not be null",
      "attribute_path": ["default_branch"],
      "values": [null],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Dataform repository git_remote_settings default_branch cannot be empty.",
      "remedies": [
        "Set default_branch to a non-empty value.",
        "Use appropriate branch name like main or master."
      ]
    },
    {
      "condition": "default_branch must not be empty",
      "attribute_path": ["default_branch"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
