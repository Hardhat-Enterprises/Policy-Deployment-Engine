package terraform.gcp.security.cloud_run.google_cloud_run_service.metadata.annotations.run.googleapis.com.vpc_access_connector

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service uses an unapproved VPC access connector",
      "remedies": [
        "Use an approved VPC access connector",
        "Set run.googleapis.com/vpc-access-connector to the approved production connector"
      ]
    },
    {
      "condition": "VPC access connector annotation must use an approved connector",
      "attribute_path": ["template", 0, "metadata", 0, "annotations", "run.googleapis.com/vpc-access-connector"],
      "values": [
        "projects/my-gcp-project/locations/australia-southeast1/connectors/prod-vpc-connector"
      ],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

