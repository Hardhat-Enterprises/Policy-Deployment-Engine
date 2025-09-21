package terraform.gcp.security.deploy.target_iam_binding.required_role
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.target_iam_binding.vars

conditions := [
  [
  {"situation_description": "Cloud Deploy Target IAM binding must not grant overly broad roles like Owner/Editor",
   "remedies": ["Remove roles/owner, roles/editor, or other administrative roles from role attribute", "Use Cloud Deploy specific roles like roles/clouddeploy.operator, roles/clouddeploy.developer, or roles/clouddeploy.viewer"]},
  {
    "condition": "Block overly permissive roles (Owner/Editor) and allow only appropriate Cloud Deploy roles",
    "attribute_path": ["role"], 
    "values": ["roles/*", [["clouddeploy.operator", "clouddeploy.developer", "clouddeploy.releaser", "clouddeploy.viewer", "clouddeploy.jobRunner"]]], 
    "policy_type": "pattern whitelist"
  }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details