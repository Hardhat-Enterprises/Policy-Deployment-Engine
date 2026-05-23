package terraform.gcp.security.containeraws.google_container_aws_cluster.proxy_secret_arn

import data.terraform.helpers
import data.terraform.gcp.security.containeraws.google_container_aws_cluster.vars

conditions := [[
  {
    "situation_description": "Control plane proxy configuration references an unapproved AWS Secrets Manager secret.",
    "remedies": ["Use the approved proxy secret ARN."],
  },
  {
    "condition": "proxy_config secret_arn must use an approved secret",
    "attribute_path": ["control_plane", 0, "proxy_config", 0, "secret_arn"],
    "values": ["arn:aws:secretsmanager:ap-southeast-2:012345678910:secret:approved-proxy-secret"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
