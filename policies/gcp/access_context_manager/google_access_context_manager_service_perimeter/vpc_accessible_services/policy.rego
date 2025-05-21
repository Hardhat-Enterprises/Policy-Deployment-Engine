package terraform.gcp.security.access_manager.google_access_context_manager_service_perimeter.vpc_accessible_services

import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_manager.google_access_context_manager_service_perimeter.vpc_accessible_services.vars

conditions := [
  [
    {
      "situation_description": "VPC accessible services restriction is not enabled.",
      "remedies": ["Set enable_restriction to true for VPC accessible services."]
    },
    {
      "condition": "Ensure enable_restriction is set to true.",
      "attribute_path": ["status", 0, "vpc_accessible_services", "enable_restriction"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "No allowed services defined under VPC accessible services.",
      "remedies": ["Specify at least one allowed service under VPC restriction."]
    },
    {
      "condition": "Ensure at least one allowed service is listed.",
      "attribute_path": ["status", 0, "vpc_accessible_services", "allowed_services"],
      "values": [1],
      "policy_type": "min_length"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
