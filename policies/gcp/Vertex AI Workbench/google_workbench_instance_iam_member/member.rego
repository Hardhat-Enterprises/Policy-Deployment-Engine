package terraform.gcp.security.vertex_ai_workbench.google_workbench_instance_iam_member.member

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.google_workbench_instance_iam_member.vars

conditions := [
  [
    {
      "situation_description": "Ensure IAM member does not grant public access. allUsers and allAuthenticatedUsers expose the notebook instance to anyone on the internet.",
      "remedies": ["Set member to a specific user, group, or service account (e.g. user:name@example.com) instead of allUsers or allAuthenticatedUsers."]
    },
    {
      "condition": "member is set to allUsers",
      "attribute_path": ["member"],
      "values": ["allUsers"],
      "policy_type": "blacklist"
    },
    {
      "condition": "member is set to allAuthenticatedUsers",
      "attribute_path": ["member"],
      "values": ["allAuthenticatedUsers"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
