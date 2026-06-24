package terraform.gcp.security.containeraws.google_container_aws_node_pool.config_kms_key_arn

import data.terraform.helpers
import data.terraform.gcp.security.containeraws.google_container_aws_node_pool.vars

conditions := [[
  {
    "situation_description": "Node pool configuration is encrypted with an unapproved AWS KMS key.",
    "remedies": ["Use the approved customer-managed KMS key ARN for node pool configuration encryption."],
  },
  {
    "condition": "config_encryption kms_key_arn must use an approved KMS key",
    "attribute_path": ["config", 0, "config_encryption", 0, "kms_key_arn"],
    "values": ["arn:aws:kms:ap-southeast-2:012345678910:key/approved-key-id"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
