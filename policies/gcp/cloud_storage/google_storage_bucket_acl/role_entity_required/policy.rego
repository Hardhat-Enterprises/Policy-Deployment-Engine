package terraform.gcp.security.cloud_storage.google_storage_bucket_acl.role_entity_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage.google_storage_bucket_acl.vars

conditions := [
  [
    {
      "situation_description": "ACL grants OWNER or WRITER to a wildcard entity (allUsers or allAuthenticatedUsers).",
      "remedies": [
        "Avoid using wildcard entities for OWNER or WRITER roles. Use specific users, groups, or domains.",
        "Consider using IAM with uniform bucket-level access instead of ACLs."
      ]
    },
    {
      "condition": "Disallow OWNER or WRITER roles for wildcard entities",
      "attribute_path": ["role_entity",0],
      "policy_type": "blacklist",
      "values": [
        "OWNER:allUsers",
        "OWNER:allAuthenticatedUsers",
        "READER:allUsers",
        "WRITER:allUsers"
      ]
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
