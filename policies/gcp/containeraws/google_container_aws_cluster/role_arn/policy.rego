package terraform.gcp.security.containeraws.google_container_aws_cluster.role_arn

import data.terraform.helpers
import data.terraform.gcp.security.containeraws.google_container_aws_cluster.vars

conditions := [[
  {
    "situation_description": "Anthos Multi-Cloud API is configured to assume an unapproved AWS IAM role.",
    "remedies": ["Use the approved AWS service role ARN."],
  },
  {
    "condition": "aws_services_authentication role_arn must use an approved role",
    "attribute_path": ["control_plane", 0, "aws_services_authentication", 0, "role_arn"],
    "values": ["arn:aws:iam::012345678910:role/approved-multicloud-role"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
