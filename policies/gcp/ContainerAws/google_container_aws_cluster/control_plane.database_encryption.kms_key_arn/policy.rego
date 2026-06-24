package terraform.gcp.security.containeraws.google_container_aws_cluster.control_plane_database_encryption_kms_key_arn

import data.terraform.helpers
import data.terraform.gcp.security.containeraws.google_container_aws_cluster.vars

conditions := [[
  {
    "situation_description": "Cluster secrets are encrypted with an unapproved AWS KMS key.",
    "remedies": ["Use the approved customer-managed KMS key ARN for database encryption."],
  },
  {
    "condition": "database_encryption kms_key_arn must use an approved KMS key",
    "attribute_path": ["control_plane", 0, "database_encryption", 0, "kms_key_arn"],
    "values": ["arn:aws:kms:ap-southeast-2:012345678910:key/approved-key-id"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
