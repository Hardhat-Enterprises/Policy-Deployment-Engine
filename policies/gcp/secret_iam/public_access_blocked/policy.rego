package terraform.gcp.security.secret_iam.public_access_blocked

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secret_iam.vars

conditions := [
  [
    {
      "situation_description": "IAM Binding includes public access via 'allUsers' or 'allAuthenticatedUsers'",
      "remedies": ["Restrict access to specific users, service accounts or groups"]
    },
    {
      "condition": "Block public IAM members",
      "attribute_path": ["members"],
      "values": ["allUsers", "allAuthenticatedUsers"],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "IAM Binding includes unknown or unapproved members",
      "remedies": ["Restrict access to approved principals only (e.g., known users or service accounts)"]
    },
    {
      "condition": "Only approved principals should be members",
      "attribute_path": ["members"],
      "values": [["user:jane@example.com"]],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
