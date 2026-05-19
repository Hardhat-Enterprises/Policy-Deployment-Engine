package terraform.gcp.security.containeraws.google_container_aws_cluster.enable_components

import data.terraform.helpers
import data.terraform.gcp.security.containeraws.google_container_aws_cluster.vars

conditions := [
  [
    {
      "situation_description": "Cluster logging is using unapproved enabled components.",
      "remedies": ["Enable only SYSTEM_COMPONENTS and WORKLOADS in logging_config.component_config.enable_components."],
    },
    {
      "condition": "logging_config.component_config.enable_components must only contain approved logging components",
      "attribute_path": ["logging_config", 0, "component_config", 0, "enable_components"],
      "values": ["SYSTEM_COMPONENTS", "WORKLOADS"],
      "policy_type": "whitelist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
