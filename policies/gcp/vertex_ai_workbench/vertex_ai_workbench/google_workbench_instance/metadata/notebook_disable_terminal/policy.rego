package terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance.metadata.notebook_disable_terminal

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure terminal access is disabled via metadata. The JupyterLab terminal provides direct shell access to the VM, bypassing notebook-level controls.",
      "remedies": ["Set gce_setup.metadata[\"notebook-disable-terminal\"] to \"true\"."]
    },
    {
      "condition": "notebook-disable-terminal is not set to true",
      "attribute_path": ["gce_setup", 0, "metadata", "notebook-disable-terminal"],
      "values": ["true"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
