package terraform.gcp.security.api_gateway.google_api_gateway_api_iam_policy.members
import data.terraform.gcp.helpers
import data.terraform.gcp.security.api_gateway.google_api_gateway_api_iam_policy.vars

conditions := [
  [
    {
      "situation_description": "IAM policy contains public or overly-broad principals",
      "remedies": ["Remove allUsers from the policy" ]
    },
    {
      "condition": "policy_data must NOT include allUsers",
      "attribute_path": ["policy_data"],
      "values": ["{\"bindings\":[{\"members\":[\"allUsers\"],\"role\":\"roles/apigateway.viewer\"}]}"],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "IAM policy contains public or overly-broad principals",
      "remedies": ["Remove granting high privilege roles for allAuthenticatedUsers" ]
    },
    {
      "condition": "policy_data must NOT include allUsers",
      "attribute_path": ["policy_data"],
      "values": ["{\"bindings\":[{\"members\":[\"allAuthenticatedUsers\"],\"role\":\"roles/owner\"}]}"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details