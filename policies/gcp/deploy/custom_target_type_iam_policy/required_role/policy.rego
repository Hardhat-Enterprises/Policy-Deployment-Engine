package terraform.gcp.security.deploy.custom_target_type_iam_policy.required_role
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.custom_target_type_iam_policy.vars

conditions := [
  [
  {"situation_description": "Cloud Deploy Custom Target Type IAM policy must not grant overly broad roles like Owner/Editor",
   "remedies": ["Remove roles/owner, roles/editor, or other administrative roles from policy_data", "Use Cloud Deploy specific roles like roles/clouddeploy.operator, roles/clouddeploy.developer, or roles/clouddeploy.viewer"]},
  {
    "condition": "Block overly permissive roles (Owner/Editor) and allow only appropriate Cloud Deploy roles",
    "attribute_path": ["policy_data"], 
    "values": ["\"role\":\"roles/*\"", [["clouddeploy.operator", "clouddeploy.developer", "clouddeploy.releaser", "clouddeploy.viewer", "clouddeploy.jobRunner"]]], 
    "policy_type": "pattern whitelist"
  }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details