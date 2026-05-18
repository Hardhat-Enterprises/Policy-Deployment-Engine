package terraform.gcp.security.containeraws.google_container_aws_node_pool.subnet_id

import data.terraform.helpers
import data.terraform.gcp.security.containeraws.google_container_aws_node_pool.vars

conditions := [[
  {
    "situation_description": "Node pool is placed in an unapproved subnet.",
    "remedies": ["Use an approved private subnet for node pool placement."],
  },
  {
    "condition": "subnet_id must use an approved private subnet",
    "attribute_path": ["subnet_id"],
    "values": ["subnet-approved-private-a"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
