package terraform.gcp.security.app_engine.google_app_engine_standard_app_version.vpc_connector_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_standard_app_version.vpc_connector_required.vars

conditions := [
  [
    {
      "situation_description": "App Engine service is not connected to a VPC via vpc_access_connector.",
      "remedies": [
        "Define a valid VPC connector using the 'vpc_access_connector' attribute"
      ]
    },
    {
      "condition": "The vpc_access_connector must not be empty",
      "attribute_path": ["vpc_access_connector"],
      "values": [[]],
      "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
