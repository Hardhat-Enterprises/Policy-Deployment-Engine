package terraform.gcp.security.storage.google_storage_bucket_acl.default_acl_nc

import data.terraform.gcp.helpers
import data.terraform.gcp.security.storage.google_storage_bucket_acl.vars

conditions := [
  [
    {
      "situation_description": "The bucket ACL uses the 'default_acl' field, which is discouraged for security and consistency reasons.",
      "remedies": [
        "Remove the use of 'default_acl' and manage access using 'predefined_acl' or 'role_entity' explicitly."
      ]
    },
    {
      "condition": "This resource sets 'default_acl' to a non-null value.",
      "attribute_path": ["default_acl"],  
      "values": ["projectPrivate"],       
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
