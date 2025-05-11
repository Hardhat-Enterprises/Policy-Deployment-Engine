package terraform.gcp.security.secretmanager.secret_iam.public_access_blocked
import data.terraform.gcp.helpers
import data.terraform.gcp.security.secretmanager.secret_iam.vars

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
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
