package terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.gce_setup_data_disks_disk_encryption

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure the data disk uses CMEK encryption. Data disks store notebooks, datasets, and model outputs which may contain sensitive information.",
      "remedies": ["Set gce_setup.data_disks.disk_encryption to CMEK and provide a valid KMS key in gce_setup.data_disks.kms_key."]
    },
    {
      "condition": "data disk encryption is not set to CMEK",
      "attribute_path": ["gce_setup", 0, "data_disks", 0, "disk_encryption"],
      "values": ["CMEK"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
