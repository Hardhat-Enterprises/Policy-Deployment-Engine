package terraform.gcp.security.app_engine.google_app_engine_standard_app_version.vpc_connector_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_standard_app_version.vpc_connector_required.vars

conditions := [
  [
    {
      "situation_description": "App Engine service is not connected to a VPC via vpc_access_connector.",
      "remedies": [
        "Define a valid VPC connector using the 'vpc_access_connector.name' attribute"
      ]
    },
    {
      "condition": "The `vpc_access_connector.name` must not be null or empty",
      "attribute_path": ["vpc_access_connector", "name"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
