package terraform.gcp.security.storage.google_storage_bucket_acl.predefined_acl

import data.terraform.gcp.helpers
import data.terraform.gcp.security.storage.google_storage_bucket_acl.vars

conditions := [
  [
    {
      "situation_description": "The bucket ACL uses 'predefined_acl', which is discouraged to ensure fine-grained access control.",
      "remedies": [
        "Use 'role_entity' instead of 'predefined_acl' for clearer ACL definitions."
      ]
    },
    {
      "condition": "This resource sets 'predefined_acl' to a non-null value.",
      "attribute_path": ["predefined_acl"],
      "values": ["private", "projectPrivate", "publicRead", "publicReadWrite", "authenticatedRead", "bucketOwnerRead", "bucketOwnerFullControl", "logDeliveryWrite"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
