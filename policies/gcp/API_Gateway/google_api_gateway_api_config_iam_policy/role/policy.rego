package terraform.gcp.security.api_gateway.google_api_gateway_api_config_iam_policy.role
import data.terraform.helpers
import data.terraform.gcp.security.api_gateway.google_api_gateway_api_config_iam_policy.vars

conditions := [
  [
    {
      "situation_description": "IAM policy contains public or overly-broad roles",
      "remedies": ["Remove Owner/Admin roles from the policy" ]
    },
    {
      "condition": "policy_data must NOT include allUsers",
      "attribute_path": ["policy_data"],
      "values": ["\"role\":\"roles/*\"", [["apigateway.admin", "owner", "editor"]]], 
      "policy_type": "pattern blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details