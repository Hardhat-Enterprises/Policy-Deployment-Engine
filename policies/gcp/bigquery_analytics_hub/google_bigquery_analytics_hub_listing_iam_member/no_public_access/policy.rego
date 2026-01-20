package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing_iam_member.no_public_access

import rego.v1
import data.terraform.helpers
import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing_iam_member.vars

conditions := [
  [
    {
      "situation_description": "Public access is enabled on BigQuery Analytics Hub Listing IAM Member through allUsers or allAuthenticatedUsers.",
      "remedies": [
        "Remove allUsers/allAuthenticatedUsers from the IAM member configuration.",
        "Use only specific identities like user:, group:, serviceAccount:, domain:, or approved principal identifiers."
      ]
    },
    {
      "condition": "Deny public principals in member field",
      "attribute_path": ["member"],
      "values": ["allUsers", "allAuthenticatedUsers"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
