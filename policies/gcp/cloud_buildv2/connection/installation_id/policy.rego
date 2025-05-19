package terraform.gcp.security.cloud_buildv2.connection.installation_id

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.connection.vars

scenarios_list := [
  # Only allow installation IDs that are explicitly approved
  [
    {
      "situation_description": "Only approved GitHub App installation IDs should be used",
      "remedies": ["Use an approved GitHub App installation ID such as 12345678"]
    },
    {
      "condition": "Unapproved GitHub App installation ID",
      "attribute_path": ["github_config", 0, "app_installation_id"],
      "values": [12345678],
      "policy_type": "whitelist"
    }
  ],
  # Block known insecure values like 0 or placeholders
  [
    {
      "situation_description": "Installation ID must not be zero or a placeholder value",
      "remedies": ["Use a valid GitHub App installation ID greater than zero"]
    },
    {
      "condition": "Installation ID is invalid",
      "attribute_path": ["github_config", 0, "app_installation_id"],
      "values": [0, 1, 999],
      "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)
message := summary.message
details := summary.details
