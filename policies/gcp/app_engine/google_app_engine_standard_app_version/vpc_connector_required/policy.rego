package terraform.gcp.security.app_engine.google_app_engine_standard_app_version.vpc_connector_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_standard_app_version.vpc_connector_required.vars

conditions := [
  [
    {
      "situation_description": "App Engine service does not define a VPC Access Connector",
      "remedies": [
        "Add a `vpc_access_connector` block to ensure traffic is routed securely"
      ]
    },
    {
      "condition": "The `vpc_access_connector` block must be defined",
      "attribute_path": ["vpc_access_connector", "name"],
      "values": [""],
      "policy_type": "not null"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
