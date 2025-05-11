package terraform.gcp.security.storage.google_storage_bucket_acl.role_entity_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.storage.google_storage_bucket_acl.vars

conditions := [
  [
    {
      "situation_description": "'role_entity' is required to define access roles explicitly.",
      "remedies": [
        "Include the 'role_entity' field to define user or group roles for the bucket."
      ]
    },
    {
      "condition": "This resource is missing or has empty 'role_entity'.",
      "attribute_path": ["role_entity"],
      "values": [null, []],  # ✅ Catch both missing and empty lists
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
