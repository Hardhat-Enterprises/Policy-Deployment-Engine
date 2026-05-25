package terraform.gcp.security.containeraws.google_container_aws_cluster.aws_region

import data.terraform.helpers
import data.terraform.gcp.security.containeraws.google_container_aws_cluster.vars

conditions := [[
  {
    "situation_description": "Container AWS cluster is deployed outside an approved Australia AWS region.",
    "remedies": ["Use ap-southeast-2 for AWS data residency."],
  },
  {
    "condition": "aws_region must use an approved Australia AWS region",
    "attribute_path": ["aws_region"],
    "values": ["ap-southeast-2"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
