package terraform.gcp.security.api_gateway.google_api_gateway_gateway_iam_member.role
import data.terraform.gcp.helpers
import data.terraform.gcp.security.api_gateway.google_api_gateway_gateway_iam_member.vars

conditions := [

  # 1. Block overly broad roles (Owner, Editor)
  [
    {"situation_description": "IAM member must not have overly broad roles",
     "remedies": ["Remove roles/owner, roles/editor and other admin roles"]},
    {
      "condition": "Blacklist Owner/Editor roles", 
      "attribute_path": ["role"],
      "values": ["roles/owner", "roles/editor", "roles/apigateway.admin"],
      "policy_type": "blacklist"
    }
  ]
  ,

  # 2. Whitelist only allowed roles
  [
    {"situation_description": "IAM member must use least-privilege roles",
     "remedies": ["Use approved roles such as roles/apigateway.viewer, roles/viewer"]},
    {
      "condition": "Whitelist approved IAM roles",
      "attribute_path": ["role"],
      "values": ["roles/apigateway.viewer", "roles/viewer"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details