package terraform.gcp.security.cloud_platform_service.google_folder_iam_policy.policy_data
import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_folder_iam_policy.vars

conditions := [

  # 2a.Block Owner/Editor roles in full policy data.
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


# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details

