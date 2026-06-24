package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing_iam_member.role

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing_iam_member.vars

conditions := [
    [
    {
      "situation_description": "Listing IAM Member must not grant high-privilege roles to allAuthenticatedUsers.",
      "remedies": [
        "Replace 'allAuthenticatedUsers' with specific identities (user:, group:, serviceAccount:, domain:).",
        "If broad access is required, restrict to a low-privilege role (e.g., roles/viewer)."
      ]
    },
    {
      "condition": "Member is allAuthenticatedUsers",
      "attribute_path": ["member"],
      "values": ["allAuthenticatedUsers"],
      "policy_type": "blacklist"
    },
    {
      "condition": "Role is high-privilege",
      "attribute_path": ["role"],
      "values": [
        "roles/owner",
        "roles/editor",
        "roles/bigquery.admin",
        "roles/resourcemanager.projectIamAdmin"
      ],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details