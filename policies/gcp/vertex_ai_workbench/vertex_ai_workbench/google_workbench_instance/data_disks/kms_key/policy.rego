package terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance.data_disks.kms_key

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure a KMS key is specified for the data disk. Without it, CMEK cannot be applied and encryption falls back to GMEK.",
      "remedies": ["Set gce_setup.data_disks.kms_key to a valid Cloud KMS key path."]
    },
    {
      "condition": "data disk kms_key is not specified",
      "attribute_path": ["gce_setup", 0, "data_disks", 0, "kms_key"],
      "values": null,
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
