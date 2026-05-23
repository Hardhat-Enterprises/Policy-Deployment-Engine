package terraform.gcp.security.containeraws.google_container_aws_node_pool.version

import data.terraform.helpers
import data.terraform.gcp.security.containeraws.google_container_aws_node_pool.vars

conditions := [[
  {
    "situation_description": "Node pool is running an unapproved Kubernetes version.",
    "remedies": ["Use an approved supported Kubernetes version."],
  },
  {
    "condition": "version must use an approved supported Kubernetes version",
    "attribute_path": ["version"],
    "values": ["1.29.0-gke.1000"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
