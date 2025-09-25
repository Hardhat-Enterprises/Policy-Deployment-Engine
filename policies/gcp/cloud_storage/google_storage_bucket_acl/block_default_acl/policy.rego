package terraform.gcp.security.cloud_storage.google_storage_bucket_acl.block_default_acl

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage.google_storage_bucket_acl.vars

conditions := [
  [
    {
      "situation_description": "'default_acl' is set, but only null is allowed to prevent misconfigured access.",
      "remedies": [
        "Remove the 'default_acl' field or set it to null. Use 'role_entity' to manage access instead."
      ]
    },
    {
      "condition": "'default_acl' must be null.",
      "attribute_path": ["default_acl"],
      "values": [null],
      "policy_type": "whitelist"
    }
  ],

  [
    {
      "situation_description": "'predefined_acl' is set, but only a null value is allowed to enforce fine-grained control via 'role_entity'.",
      "remedies": [
        "Remove 'predefined_acl' or set it to null, and define access using 'role_entity' instead."
      ]
    },
    {
      "condition": "'predefined_acl' must be null.",
      "attribute_path": ["predefined_acl"],
      "values": [null],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
