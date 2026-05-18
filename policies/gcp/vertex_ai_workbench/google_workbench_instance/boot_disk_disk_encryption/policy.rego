package terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.boot_disk_disk_encryption

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure the boot disk uses CMEK encryption. The default (GMEK) provides no key revocation capability during incidents. This setting is immutable after creation.",
      "remedies": ["Set gce_setup.boot_disk.disk_encryption to CMEK and provide a valid KMS key in gce_setup.boot_disk.kms_key."]
    },
    {
      "condition": "boot disk encryption is not set to CMEK",
      "attribute_path": ["gce_setup", 0, "boot_disk", 0, "disk_encryption"],
      "values": ["CMEK"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
