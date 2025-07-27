package terraform.gcp.security.cloud_storage.bucket_acl.default_acl_nc

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage.bucket_acl.vars

conditions := [
  [
    {
      "situation_description": "'default_acl' is set, but only null is allowed to prevent misconfigured access.",
      "remedies": [
        "Remove the 'default_acl' field or set it to null. Use 'predefined_acl' or 'role_entity' to manage access instead."
      ]
    },
    {
      "condition": "'default_acl' must be null.",
      "attribute_path": ["default_acl"],
      "values": [null],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
