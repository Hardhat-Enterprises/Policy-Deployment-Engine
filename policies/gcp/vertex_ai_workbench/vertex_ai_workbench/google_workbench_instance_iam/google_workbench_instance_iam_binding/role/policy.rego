package terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance_iam.google_workbench_instance_iam_binding.role

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance_iam.google_workbench_instance_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Ensure overly permissive IAM roles are not granted on the Workbench instance. roles/owner and roles/editor grant excessive access beyond what is needed.",
      "remedies": ["Use least-privilege roles such as roles/notebooks.viewer, roles/notebooks.runner, or roles/notebooks.admin instead of roles/owner or roles/editor."]
    },
    {
      "condition": "role is set to roles/owner",
      "attribute_path": ["role"],
      "values": ["roles/owner"],
      "policy_type": "blacklist"
    },
    {
      "condition": "role is set to roles/editor",
      "attribute_path": ["role"],
      "values": ["roles/editor"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
