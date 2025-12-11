package terraform.gcp.security.api_gateway.google_api_gateway_api_iam_member.member
import data.terraform.helpers
import data.terraform.gcp.security.api_gateway.google_api_gateway_api_iam_member.vars

conditions := [
  [
    {
      "situation_description": "IAM member is public or overly-broad",
      "remedies": ["Replace with a group or service account from your domain" ]
    },
    {
      "condition": "member must NOT be public/broad",
      "attribute_path": ["member"],
      "values":["allUsers"],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Domain-wide grants are not allowed",
      "remedies": [
        "Replace domain: principals with explicit user:/group: members"
      ]
    },
    {
      "condition": "member must not be domain-scoped",
      "attribute_path": ["member"],
      "values": ["domain:example.com"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
