package terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.enable_vtpm

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure vTPM is enabled. vTPM provides measured boot integrity validation and supports disk encryption key protection.",
      "remedies": ["Set gce_setup.shielded_instance_config.enable_vtpm to true."]
    },
    {
      "condition": "enable_vtpm is not set to true",
      "attribute_path": ["gce_setup", 0, "shielded_instance_config", 0, "enable_vtpm"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
