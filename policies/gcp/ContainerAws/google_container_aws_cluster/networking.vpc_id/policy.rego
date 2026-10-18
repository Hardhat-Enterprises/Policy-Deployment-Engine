package terraform.gcp.security.containeraws.google_container_aws_cluster.networking_vpc_id

import data.terraform.helpers
import data.terraform.gcp.security.containeraws.google_container_aws_cluster.vars

conditions := [[
  {
    "situation_description": "Cluster is associated with an unapproved AWS VPC.",
    "remedies": ["Use the approved VPC for cluster networking."],
  },
  {
    "condition": "vpc_id must use an approved VPC",
    "attribute_path": ["networking", 0, "vpc_id"],
    "values": ["vpc-approved"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
