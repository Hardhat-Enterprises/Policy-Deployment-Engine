package terraform.gcp.security.secretmanager.secret_iam.iam_roles_restricted
import data.terraform.gcp.helpers
import data.terraform.gcp.security.secretmanager.secret_iam.vars

conditions := [
  [
    {
      "situation_description": "IAM binding uses an overly permissive role like owner/editor/viewer",
      "remedies": [
        "Use principle of least privilege like roles/secretmanager.secretAccessor"
      ]
    },
    {
      "condition": "Restrict roles that grant full project access",
      "attribute_path": ["role"],
      "values": ["roles/owner", "roles/editor", "roles/viewer"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
