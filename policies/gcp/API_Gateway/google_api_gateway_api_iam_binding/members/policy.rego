package terraform.gcp.security.api_gateway.google_api_gateway_api_iam_binding.members
import data.terraform.gcp.helpers
import data.terraform.gcp.security.api_gateway.google_api_gateway_api_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "IAM binding uses a public or overly-broad member",
      "remedies": ["Replace with a group or service account from your domain" ]
    },
    {
      "condition": "member must NOT be public/broad",
      "attribute_path": ["members"],
      "values":["allUsers", "allAuthenticatedUsers"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
