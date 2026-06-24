package terraform.gcp.security.containeraws.google_container_aws_cluster.version

import data.terraform.helpers
import data.terraform.gcp.security.containeraws.google_container_aws_cluster.vars

conditions := [[
  {
    "situation_description": "Control plane is running an unapproved Kubernetes version.",
    "remedies": ["Use an approved supported Kubernetes version."],
  },
  {
    "condition": "control_plane version must use an approved supported version",
    "attribute_path": ["control_plane", 0, "version"],
    "values": ["1.29.0-gke.1000"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
