package terraform.gcp.security.cloud_spanner.google_spanner_instance_iam_member.member

import data.terraform.helpers
import data.terraform.gcp.security.cloud_spanner.google_spanner_instance_iam_member.vars

conditions := [
  [
    {
      "situation_description": "Cloud Spanner instance IAM member grants access to allUsers or allAuthenticatedUsers, making the instance publicly accessible.",
      "remedies": [
        "Remove allUsers and allAuthenticatedUsers from the member field and grant access only to specific identities."
      ]
    },
    {
      "condition": "member must not be allUsers or allAuthenticatedUsers",
      "attribute_path": ["member"],
      "values": ["allUsers", "allAuthenticatedUsers"],
      "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
