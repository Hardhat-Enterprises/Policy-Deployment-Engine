package terraform.gcp.security.containeraws.google_container_aws_node_pool.config_security_group_ids

import data.terraform.helpers
import data.terraform.gcp.security.containeraws.google_container_aws_node_pool.vars

conditions := [[
  {
    "situation_description": "Node pool instances are using unapproved AWS security groups.",
    "remedies": ["Use only approved security group IDs for node pool instances."],
  },
  {
    "condition": "security_group_ids must use approved node pool security groups",
    "attribute_path": ["config", 0, "security_group_ids"],
    "values": ["sg-approved-node-pool"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
