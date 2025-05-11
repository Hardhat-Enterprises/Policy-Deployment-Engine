package terraform.gcp.security.access_manager.service_perimeter.vpc_accessible_services

import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_manager.service_perimeter.vpc_accessible_services.vars

conditions := [
  [
    {"situation_description": "VPC accessible services restriction is not enabled",
     "remedies": ["Set enable_restriction to true for VPC accessible services"]},
    {
      "condition": "Ensure enable_restriction is set to true",
      "attribute_path": ["status", "vpc_accessible_services", "enable_restriction"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ],
  [
    {"situation_description": "No allowed services defined under VPC restriction",
     "remedies": ["Specify services allowed through VPC"]},
    {
      "condition": "Ensure at least one allowed service is listed",
      "attribute_path": ["status", "vpc_accessible_services", "allowed_services"],
      "values": [1, null],
      "policy_type": "range"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details