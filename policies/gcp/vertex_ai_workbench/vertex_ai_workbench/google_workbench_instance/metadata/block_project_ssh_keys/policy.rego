package terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance.metadata.block_project_ssh_keys

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure project-wide SSH keys are blocked. Allowing them means any project member with SSH key access can reach the instance, bypassing IAM controls.",
      "remedies": ["Set gce_setup.metadata[\"block-project-ssh-keys\"] to \"true\"."]
    },
    {
      "condition": "block-project-ssh-keys is not set to true",
      "attribute_path": ["gce_setup", 0, "metadata", "block-project-ssh-keys"],
      "values": ["true"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
