package terraform.gcp.security.cloud_buildv2.connection.iam_member.public_access

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.connection.vars

scenarios_list := [
  [
    {
      "situation_description": "IAM member must not be an anonymous or allUsers account",
      "remedies": ["Avoid using 'allUsers' or 'allAuthenticatedUsers'"]
    },
    {
      "condition": "IAM member is public",
      "attribute_path": ["member"],
      "values": ["allUsers", "allAuthenticatedUsers"],
      "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)
message := summary.message
details := summary.details
