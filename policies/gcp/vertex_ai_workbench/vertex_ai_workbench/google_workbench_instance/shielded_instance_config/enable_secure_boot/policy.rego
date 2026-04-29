package terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance.shielded_instance_config.enable_secure_boot

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure Secure Boot is enabled. Disabled by default, without it the VM can execute unsigned boot code, enabling rootkits and bootkits.",
      "remedies": ["Set gce_setup.shielded_instance_config.enable_secure_boot to true."]
    },
    {
      "condition": "enable_secure_boot is not set to true",
      "attribute_path": ["gce_setup", 0, "shielded_instance_config", 0, "enable_secure_boot"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
