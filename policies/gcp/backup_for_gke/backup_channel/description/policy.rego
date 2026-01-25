package terraform.gcp.security.backup_for_gke.backup_channel.description
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.backup_channel.vars

conditions := [
  [
    {
      "situation_description": "GKE Backup Channel description must be set and meaningful.",
      "remedies": ["Set the description to a meaningful string (at least 10 characters)."]
    },
    {
      "condition": "Description must not be empty or null",
      "attribute_path": ["description"],
      "values": ["", null],
      "policy_type": "blacklist"
    },
    {
      "condition": "Description must be at least 10 characters",
      "attribute_path": ["description"],
      "values": ["^.{0,9}$"],
      "policy_type": "pattern_blacklist"
    }
  ],
  [
    {
      "situation_description": "GKE Backup Channel description must not contain restricted keywords.",
      "remedies": ["Remove 'test' or 'temp' from description in production."]
    },
    {
      "condition": "Description must not contain 'test' or 'temp'",
      "attribute_path": ["description"],
      "values": ["(?i).*test.*", "(?i).*temp.*"],
      "policy_type": "pattern_blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
