package terraform.gcp.security.cloud_platform_service.google_folder_iam_policy.policy_data
import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_folder_iam_policy.vars

conditions := [

  # Block Owner/Editor roles in full policy data.
  [
  {"situation_description": "Folder IAM policy must not grant overly broad roles",
   "remedies": ["Remove roles/owner or roles/editor from policy_data"]},
  {
    "condition": "Block overly permissive roles (Owner/Editor)",
    "attribute_path": ["policy_data"], 
    "values": ["\"role\":\"roles/*\"", [["viewer"]]], # role = roles/viewer
    "policy_type": "pattern whitelist"
  }
  ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

