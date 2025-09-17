package terraform.gcp.security.cloud_platform_service.google_folder_iam_binding.iam_binding
import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_folder_iam_binding.vars

conditions := [

  # 1. Block overly broad roles (Owner, Editor)
  [
    {"situation_description": "IAM binding must not assign overly broad roles",
     "remedies": ["Remove roles/owner and roles/editor"]},
    {
      "condition": "Blacklist Owner/Editor roles",
      "attribute_path": ["role"],
      "values": ["roles/owner", "roles/editor"],
      "policy_type": "blacklist"
    }
  ]
  ,

  # 2. Whitelist only allowed roles
  [
    {"situation_description": "IAM binding must use least-privilege roles",
     "remedies": ["Use approved roles such as roles/viewer, roles/logging.viewer"]},
    {
      "condition": "Whitelist approved IAM roles",
      "attribute_path": ["role"],
      "values": ["roles/viewer", "roles/logging.viewer"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
