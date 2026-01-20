package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_data_exchange_iam_member.public_access

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_data_exchange_iam_member.vars

conditions := [
  [
    {
      "situation_description": "Data Exchange IAM Member must not be publicly accessible.",
    "remedies": [
        "Remove 'allUsers' and 'allAuthenticatedUsers' from IAM members.",
        "Grant access only to approved identities such as users, groups, or service accounts."
      ]
    },
    {
      "condition": "Disallow public IAM principals in member",
      "attribute_path": ["member"],
      "values": ["allUsers", "allAuthenticatedUsers"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
