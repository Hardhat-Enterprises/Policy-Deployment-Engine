package terraform.gcp.security.storage.google_storage_bucket_acl.role_entity_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.storage.google_storage_bucket_acl.vars

conditions := [
  [
    {
      "situation_description": "'role_entity' contains unapproved values.",
      "remedies": [
        "Ensure 'role_entity' only includes approved entities: user:user@example.com, group:admin@example.com, or domain:example.com"
      ]
    },
    {
      "condition": "Only exact whitelisted role_entity sets allowed.",
      "attribute_path": ["role_entity"],
      "values": [
        ["user:user@example.com", "group:admin@example.com", "domain:example.com"],
        ["group:admin@example.com", "user:user@example.com", "domain:example.com"]
        # Add permutations if needed
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
