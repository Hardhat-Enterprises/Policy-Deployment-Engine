package terraform.gcp.security.cloud_storage.google_storage_object_acl.role_entity

import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage.google_storage_object_acl.vars

conditions := [
  [
    {
      "situation_description": "'object should not have public access.",
      "remedies": [
        "Change the entity. It cannot be allUsers or allAuthenticatedUsers."
      ]
    },

    {
      "condition": "Public access to objects should be prohibited.",
      "attribute_path": ["role_entity",0],
      "values": ["*:*",[[],["allUsers","allAuthenticatedUsers"]]],
      "policy_type": "pattern blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
