package terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline_iam_member.role
import data.terraform.helpers
import data.terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline_iam_member.vars

conditions := [
  [
  {"situation_description": "Cloud Deploy Delivery Pipeline IAM member must not grant overly broad roles like Owner/Editor",
   "remedies": ["Remove roles/owner, roles/editor, or other administrative roles from role attribute", "Use Cloud Deploy specific roles like roles/clouddeploy.operator, roles/clouddeploy.developer, or roles/clouddeploy.viewer"]},
  {
    "condition": "Block overly permissive roles (Owner/Editor) and allow only appropriate Cloud Deploy roles",
    "attribute_path": ["role"], 
    "values": ["roles/*", [["clouddeploy.operator", "clouddeploy.developer", "clouddeploy.releaser", "clouddeploy.viewer", "clouddeploy.jobRunner"]]], 
    "policy_type": "pattern whitelist"
  }
  ]
]
    
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
