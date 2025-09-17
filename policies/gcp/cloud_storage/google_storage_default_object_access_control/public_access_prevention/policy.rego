package terraform.gcp.security.cloud_storage.google_storage_default_object_access_control.public_access_prevention

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage.google_storage_default_object_access_control.vars

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
      "attribute_path": ["entity"],
      "values": ["allUsers","allAuthenticatedUsers"],
      "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
