package terraform.gcp.security.containeraws.google_container_aws_cluster.per_node_pool_sg_rules_disabled

import data.terraform.helpers
import data.terraform.gcp.security.containeraws.google_container_aws_cluster.vars

conditions := [[
  {
    "situation_description": "Managed per-node-pool security group rules are disabled.",
    "remedies": ["Keep per_node_pool_sg_rules_disabled set to false unless approved replacement rules are in place."],
  },
  {
    "condition": "per_node_pool_sg_rules_disabled must remain false",
    "attribute_path": ["networking", 0, "per_node_pool_sg_rules_disabled"],
    "values": [false],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
