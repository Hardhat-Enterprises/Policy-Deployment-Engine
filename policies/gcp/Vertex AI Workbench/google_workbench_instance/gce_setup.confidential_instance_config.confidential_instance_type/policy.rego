package terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.gce_setup_confidential_instance_config_confidential_instance_type

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure Confidential VM is configured. Confidential VMs use AMD SEV to encrypt memory at runtime, protecting data-in-use from hypervisor-level attacks.",
      "remedies": ["Set gce_setup.confidential_instance_config.confidential_instance_type to SEV with a compatible machine type (e.g. n2d-standard-*)."]
    },
    {
      "condition": "confidential_instance_type is not set",
      "attribute_path": ["gce_setup", 0, "confidential_instance_config", 0, "confidential_instance_type"],
      "values": null,
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
