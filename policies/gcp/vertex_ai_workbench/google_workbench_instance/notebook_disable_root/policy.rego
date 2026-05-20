package terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.notebook_disable_root

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure root access is disabled via metadata. Running notebooks as root increases the blast radius of any code execution vulnerability.",
      "remedies": ["Set gce_setup.metadata[\"notebook-disable-root\"] to \"true\"."]
    },
    {
      "condition": "notebook-disable-root is not set to true",
      "attribute_path": ["gce_setup", 0, "metadata", "notebook-disable-root"],
      "values": ["true"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
