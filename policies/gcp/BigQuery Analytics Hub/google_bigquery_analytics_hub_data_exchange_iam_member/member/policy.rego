package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_data_exchange_iam_member.member

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_data_exchange_iam_member.vars

conditions := [

  [
    {
      "situation_description": "Data Exchange IAM Member must not grant public access (allUsers or allAuthenticatedUsers).",
      "remedies": [
        "Remove 'allUsers' and 'allAuthenticatedUsers' from the IAM member.",
        "Grant access only to specific identities such as user:, group:, serviceAccount:, or domain:."
      ]
    },
    {
      "condition": "Disallow allUsers",
      "attribute_path": ["member"],
      "values": ["allUsers"],
      "policy_type": "blacklist"
    },
    {
      "condition": "Disallow allAuthenticatedUsers",
      "attribute_path": ["member"],
      "values": ["allAuthenticatedUsers"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
