package terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function.vpc

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function.vars

conditions := [
  [
    {
      "situation_description": "Function is missing a VPC connector, which may expose it to public internet egress.",
      "remedies": [
        "Specify a 'vpc_connector' in the 'service_config' block to route traffic through a private network."
      ]
    },
    {
      "condition": "Function must specify a VPC connector.",
      "attribute_path": ["vpc_connector"],
       "values": [""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details