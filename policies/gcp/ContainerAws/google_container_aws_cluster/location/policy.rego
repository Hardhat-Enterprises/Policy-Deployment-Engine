package terraform.gcp.security.containeraws.google_container_aws_cluster.location

import data.terraform.helpers
import data.terraform.gcp.security.containeraws.google_container_aws_cluster.vars

conditions := [[
  {
    "situation_description": "Container AWS cluster metadata is stored outside an approved Australia Google Cloud region.",
    "remedies": ["Use australia-southeast1 for Google Cloud data residency."],
  },
  {
    "condition": "location must use an approved Australia Google Cloud region",
    "attribute_path": ["location"],
    "values": ["australia-southeast1"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
