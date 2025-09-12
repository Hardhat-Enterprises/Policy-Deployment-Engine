package terraform.gcp.security.cloud_platform_service.google_folder.deletion_protection

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_folder.vars

conditions := [

  [
    {"situation_description": "Folders must have deletion protection enabled",
     "remedies": ["Set deletion_protection = true to prevent accidental deletion"]},
    {
      "condition": "Require deletion_protection to be true",
      "attribute_path": ["deletion_protection"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
