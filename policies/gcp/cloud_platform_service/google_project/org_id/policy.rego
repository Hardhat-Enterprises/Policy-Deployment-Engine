package terraform.gcp.security.cloud_platform_service.google_project.org_id

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_project.vars

# Non-compliant when BOTH org_id and folder_id are null.
conditions := [
    [
    {"situation_description": "Project must be attached to an organization or a folder.",
     "remedies": ["Set org_id OR folder_id (at least one must be defined)."]},

    { 
      "condition": "org_id is null", 
      "attribute_path": ["org_id"], 
      "values": [null], 
      "policy_type": "blacklist" 
    },

    {
      "condition": "folder_id is null",
      "attribute_path": ["folder_id"],
      "values": [null],
      "policy_type": "blacklist"
    }
  ]
]
 

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

