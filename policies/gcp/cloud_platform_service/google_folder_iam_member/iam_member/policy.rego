package terraform.gcp.security.cloud_platform_service.google_folder_iam_member.iam_member
import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_folder_iam_member.vars

conditions := [

  # Same as binding — block risky roles, check members.
  [
  {"situation_description": "IAM member must not have overly broad roles",
   "remedies": ["Reassign to least-privilege roles"]},
  {
    "condition": "Block Owner/Editor roles for IAM member",
    "attribute_path": ["role"],
    "values": ["roles/owner", "roles/editor"],
    "policy_type": "blacklist"
  }
]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

