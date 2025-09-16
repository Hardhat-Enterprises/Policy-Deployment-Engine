package terraform.gcp.security.cloud_storage.google_storage_managed_folder_iam_binding.public_access_prevention

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage.google_storage_managed_folder_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "'Access is too broad.",
      "remedies": [
        "Change the members. It cannot be allUsers or allAuthenticatedUsers."
      ]
    },

    {
      "condition": "Public access should be prohibited.",
      "attribute_path": ["members",0],
      "values": ["allUsers","allAuthenticatedUsers"],
      "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details