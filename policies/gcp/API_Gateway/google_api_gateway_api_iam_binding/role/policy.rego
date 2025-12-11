package terraform.gcp.security.api_gateway.google_api_gateway_api_iam_binding.role
import data.terraform.helpers
import data.terraform.gcp.security.api_gateway.google_api_gateway_api_iam_binding.vars

conditions := [
  # Block overly broad roles (Owner, Editor) for allAuthenticatedUsers
  [
    {"situation_description": "IAM binding must not assign overly broad roles",
     "remedies": ["Remove roles/owner, roles/editor and other admin roles from allAuthenticatedUsers"]},
    {
      "condition": "Blacklist Owner/Editor roles",
      "attribute_path": ["role"],
      "values": ["roles/owner", "roles/editor", "roles/apigateway.admin"],
      "policy_type": "blacklist"
    },
    {
      "condition": "Blacklist Owner/Editor roles",
      "attribute_path": ["members"],
      "values": ["allAuthenticatedUsers"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details