package terraform.gcp.security.cloud_storage.google_storage_object_acl.predefined_acl

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage.google_storage_object_acl.vars

conditions := [
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