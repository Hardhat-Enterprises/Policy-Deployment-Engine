package terraform.gcp.security.deploy.custom_target_type_iam_binding.role
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.custom_target_type_iam_binding.vars

conditions := [
  # Block overly permissive roles in Cloud Deploy Custom Target Type IAM binding
  [
  {"situation_description": "Cloud Deploy Custom Target Type IAM binding must not grant overly broad roles like Owner/Editor",
   "remedies": ["Remove roles/owner, roles/editor, or other administrative roles from role attribute", "Use Cloud Deploy specific roles like roles/clouddeploy.operator, roles/clouddeploy.developer, or roles/clouddeploy.viewer"]},
  {
    "condition": "Block overly permissive roles (Owner/Editor) and allow only appropriate Cloud Deploy roles",
    "attribute_path": ["role"], 
    "values": ["roles/*", [["clouddeploy.operator", "clouddeploy.developer", "clouddeploy.releaser", "clouddeploy.viewer", "clouddeploy.jobRunner"]]], 
    "policy_type": "pattern whitelist"
  }
  ]
]

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.clouddeploy.google_clouddeploy_custom_target_type_iam_binding.roles.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.clouddeploy.google_clouddeploy_custom_target_type_iam_binding.roles.details"
details := helpers.get_multi_summary(conditions, vars.variables).details