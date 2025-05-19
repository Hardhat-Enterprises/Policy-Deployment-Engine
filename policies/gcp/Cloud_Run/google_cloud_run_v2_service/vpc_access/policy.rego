package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.vpc_access

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.vars

# List of approved VPC connectors
approved_connectors := [
  "projects/my-project/locations/AU/connectors/my-vpc-connector"
]

conditions := [
  [
    {
      "situation_description": "Cloud Run v2 Service must use an approved VPC Access Connector.",
      "remedies": [
        "Specify a valid VPC connector from the approved list."
      ]
    },
    {
      "condition": "VPC connector must be in the approved list and not empty",
      "attribute_path": ["template", "vpc_access", "connector"],
      "values": approved_connectors,
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
