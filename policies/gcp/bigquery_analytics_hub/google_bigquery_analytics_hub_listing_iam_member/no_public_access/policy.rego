package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing_iam_member.no_public_access

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing_iam_member.vars

conditions := [

  # Situation 1: allUsers must never be allowed
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
  ],

  # Situation 2: allAuthenticatedUsers is allowed ONLY with low-priv roles
  # Non-compliant ONLY when member == allAuthenticatedUsers AND role is high-priv
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
