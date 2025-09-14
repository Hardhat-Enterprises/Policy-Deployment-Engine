package terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function.vpc

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function.vars

conditions := [
  [
    {
      "situation_description": "Function must specify a VPC connector to route traffic through a private network.",
      "remedies": [
        "Specify a 'vpc_connector' in the 'service_config' block using an approved connector."
      ]
    },
    {
      "condition": "Function must use an approved VPC connector.",
      "attribute_path": ["service_config", 0, "vpc_connector"],
      "values": [
        "projects/my-project/locations/us-central1/connectors/my-vpc-connector"
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details