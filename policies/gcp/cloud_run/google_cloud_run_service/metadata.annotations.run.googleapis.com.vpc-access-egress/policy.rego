package terraform.gcp.security.cloud_run.google_cloud_run_service.metadata.annotations.run.googleapis.com.vpc_access_egress

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service uses unapproved VPC egress routing",
      "remedies": [
        "Use approved VPC egress routing",
        "Set run.googleapis.com/vpc-access-egress to private-ranges-only"
      ]
    },
    {
      "condition": "VPC access egress annotation must use an approved value",
      "attribute_path": ["template", 0, "metadata", 0, "annotations", "run.googleapis.com/vpc-access-egress"],
      "values": ["private-ranges-only"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details