package terraform.gcp.security.cloud_platform_service.google_folder_iam_member.role
import data.terraform.helpers
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

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

