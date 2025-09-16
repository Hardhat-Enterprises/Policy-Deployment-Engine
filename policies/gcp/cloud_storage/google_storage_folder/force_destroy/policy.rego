package terraform.gcp.security.cloud_storage.google_storage_folder.force_destroy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage.google_storage_folder.vars


conditions := [
  [
    {
      "situation_description": "Folder has force_destroy enabled, which can lead to unintended data deletion.",
      "remedies": ["Set force_destroy to false to prevent accidental folder deletion."]
      
    },
        
    {
      "condition": "force_destroy should be false for safe deletion practices.",
      "attribute_path": ["force_destroy"],
      "values": [false],  
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
