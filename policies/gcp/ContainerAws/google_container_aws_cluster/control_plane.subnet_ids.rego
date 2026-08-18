package terraform.gcp.security.containeraws.google_container_aws_cluster.control_plane_subnet_ids

import data.terraform.helpers
import data.terraform.gcp.security.containeraws.google_container_aws_cluster.vars

conditions := [[
  {
    "situation_description": "Control plane replicas are placed in unapproved subnets.",
    "remedies": ["Use only approved private subnets for control plane replicas."],
  },
  {
    "condition": "subnet_ids must use approved private subnets",
    "attribute_path": ["control_plane", 0, "subnet_ids"],
    "values": ["subnet-approved-private-a", "subnet-approved-private-b"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
