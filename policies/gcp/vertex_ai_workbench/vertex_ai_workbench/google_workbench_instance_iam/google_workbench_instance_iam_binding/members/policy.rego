package terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance_iam.google_workbench_instance_iam_binding.members

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance_iam.google_workbench_instance_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Ensure IAM bindings do not grant public access. allUsers and allAuthenticatedUsers expose the notebook instance to anyone on the internet.",
      "remedies": ["Remove allUsers and allAuthenticatedUsers from the members list. Grant access to specific users, groups, or service accounts only."]
    },
    {
      "condition": "members contains allUsers",
      "attribute_path": ["members"],
      "values": ["allUsers"],
      "policy_type": "element blacklist"
    },
    {
      "condition": "members contains allAuthenticatedUsers",
      "attribute_path": ["members"],
      "values": ["allAuthenticatedUsers"],
      "policy_type": "element blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
