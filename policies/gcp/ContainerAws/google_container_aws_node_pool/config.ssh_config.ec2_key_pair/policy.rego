package terraform.gcp.security.containeraws.google_container_aws_node_pool.config_ssh_config_ec2_key_pair

import data.terraform.helpers
import data.terraform.gcp.security.containeraws.google_container_aws_node_pool.vars

conditions := [[
  {
    "situation_description": "Node pool SSH access is configured with an unapproved EC2 key pair.",
    "remedies": ["Use an approved managed EC2 key pair for SSH access."],
  },
  {
    "condition": "ssh_config ec2_key_pair must use an approved key pair",
    "attribute_path": ["config", 0, "ssh_config", 0, "ec2_key_pair"],
    "values": ["approved-ec2-key-pair"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
