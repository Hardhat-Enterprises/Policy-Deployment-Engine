package terraform.gcp.security.containeraws.google_container_aws_cluster.evaluation_mode

import data.terraform.helpers
import data.terraform.gcp.security.containeraws.google_container_aws_cluster.vars

conditions := [[
  {
    "situation_description": "Binary Authorization is not enforcing the approved policy.",
    "remedies": ["Set binary_authorization evaluation_mode to PROJECT_SINGLETON_POLICY_ENFORCE."],
  },
  {
    "condition": "binary_authorization evaluation_mode must enforce the project policy",
    "attribute_path": ["binary_authorization", 0, "evaluation_mode"],
    "values": ["PROJECT_SINGLETON_POLICY_ENFORCE"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
