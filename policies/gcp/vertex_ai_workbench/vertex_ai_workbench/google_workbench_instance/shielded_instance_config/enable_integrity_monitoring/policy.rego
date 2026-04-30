package terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance.shielded_instance_config.enable_integrity_monitoring

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure Integrity Monitoring is enabled. It detects runtime boot sequence tampering that may indicate rootkit or bootkit compromise.",
      "remedies": ["Set gce_setup.shielded_instance_config.enable_integrity_monitoring to true."]
    },
    {
      "condition": "enable_integrity_monitoring is not set to true",
      "attribute_path": ["gce_setup", 0, "shielded_instance_config", 0, "enable_integrity_monitoring"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
