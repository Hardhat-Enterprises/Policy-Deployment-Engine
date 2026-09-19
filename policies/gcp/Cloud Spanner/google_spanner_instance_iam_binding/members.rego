package terraform.gcp.security.cloud_spanner.google_spanner_instance_iam_binding.members

import data.terraform.helpers
import data.terraform.gcp.security.cloud_spanner.google_spanner_instance_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Cloud Spanner instance IAM binding grants access to allUsers or allAuthenticatedUsers, making the instance publicly accessible.",
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

message := summary.message
details := summary.details
