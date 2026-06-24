package terraform.gcp.security.cloud_spanner.google_spanner_database_iam_binding.no_public_access

import data.terraform.helpers
import data.terraform.gcp.security.cloud_spanner.google_spanner_database_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Cloud Spanner database IAM binding grants access to allUsers or allAuthenticatedUsers, making the database publicly accessible.",
      "remedies": [
        "Remove allUsers and allAuthenticatedUsers from the members list and grant access only to specific identities."
      ]
    },
    {
      "condition": "members must not include allUsers or allAuthenticatedUsers",
      "attribute_path": ["members"],
      "values": ["allUsers", "allAuthenticatedUsers"],
      "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
