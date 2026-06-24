package terraform.gcp.security.containeraws.google_container_aws_node_pool.iam_instance_profile

import data.terraform.helpers
import data.terraform.gcp.security.containeraws.google_container_aws_node_pool.vars

conditions := [[
  {
    "situation_description": "Node pool is using an unapproved IAM instance profile.",
    "remedies": ["Use an approved IAM instance profile for node pools."],
  },
  {
    "condition": "iam_instance_profile must use an approved profile",
    "attribute_path": ["config", 0, "iam_instance_profile"],
    "values": ["approved-profile"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
