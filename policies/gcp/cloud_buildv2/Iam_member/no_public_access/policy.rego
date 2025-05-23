package terraform.gcp.security.cloud_buildv2.iam_member.no_public_access

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.iam_member.vars

scenarios_list := [
  [
    {
      "situation_description": "IAM member must not be public (allUsers or allAuthenticatedUsers)",
      "remedies": ["Remove public IAM member entries like 'allUsers' or 'allAuthenticatedUsers'"]
    },
    {
      "condition": "IAM member is publicly exposed",
      "attribute_path": ["member"],
      "values": ["allUsers", "allAuthenticatedUsers"],
      "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)
message := summary.message
details := summary.details
