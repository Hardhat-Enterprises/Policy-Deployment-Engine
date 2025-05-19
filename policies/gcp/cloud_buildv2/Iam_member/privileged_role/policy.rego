package terraform.gcp.security.cloud_buildv2.connection.iam_member.privileged_role

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.connection.vars

scenarios_list := [
  [
    {
      "situation_description": "IAM members must not have overly permissive roles",
      "remedies": ["Avoid assigning roles like 'roles/owner' which provide full access"]
    },
    {
      "condition": "IAM member has overly permissive role",
      "attribute_path": ["role"],
      "values": ["roles/owner"],
      "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)
message := summary.message
details := summary.details
