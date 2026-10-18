package terraform.gcp.security.containeraws.google_container_aws_cluster.control_plane_iam_instance_profile

import data.terraform.helpers
import data.terraform.gcp.security.containeraws.google_container_aws_cluster.vars

conditions := [[
  {
    "situation_description": "Control plane replicas are using an unapproved IAM instance profile.",
    "remedies": ["Use the approved least-privilege IAM instance profile for control plane replicas."],
  },
  {
    "condition": "iam_instance_profile must use an approved control plane profile",
    "attribute_path": ["control_plane", 0, "iam_instance_profile"],
    "values": ["approved-control-plane-profile"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
