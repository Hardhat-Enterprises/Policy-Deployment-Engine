package terraform.gcp.security.compute.instance.interface

import data.terraform.gcp.security.compute.instance.vars
import data.terraform.gcp.helpers

conditions := [
  [
    {
      "situation_description": "Disk interface must not use disallowed SCSI option",
      "remedies": [
        "Set scratch_disk.interface to 'NVME' to use faster local SSD access"
      ]
    },
    {
      "condition": "Disallowed disk interface 'SCSI' is used",
      "attribute_path": ["scratch_disk", 0, "interface"],
      "values": ["SCSI"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
