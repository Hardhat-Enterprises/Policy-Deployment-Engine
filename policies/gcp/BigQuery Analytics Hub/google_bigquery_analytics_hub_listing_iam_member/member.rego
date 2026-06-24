package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing_iam_member.member

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing_iam_member.vars

conditions := [
    [
    {
      "situation_description": "Listing IAM Member must not grant public access to anyone on the internet (allUsers).",
      "remedies": [
        "Remove 'allUsers' from the IAM member configuration.",
        "Grant access only to approved identities such as user:, group:, serviceAccount:, or domain:."
      ]
    },
    {
      "condition": "Disallow allUsers in member",
      "attribute_path": ["member"],
      "values": ["allUsers"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details