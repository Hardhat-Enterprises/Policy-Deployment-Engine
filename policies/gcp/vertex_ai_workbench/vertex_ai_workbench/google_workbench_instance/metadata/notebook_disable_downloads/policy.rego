package terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance.metadata.notebook_disable_downloads

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure file downloads are disabled via metadata. Unrestricted downloads can be used to exfiltrate data or introduce malicious files.",
      "remedies": ["Set gce_setup.metadata[\"notebook-disable-downloads\"] to \"true\"."]
    },
    {
      "condition": "notebook-disable-downloads is not set to true",
      "attribute_path": ["gce_setup", 0, "metadata", "notebook-disable-downloads"],
      "values": ["true"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
