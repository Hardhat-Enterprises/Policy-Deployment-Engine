package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.status_restricted_services

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars

conditions := [
  [
    {
      "situation_description": "Restricted services should explicitly identify protected Google Cloud services and must not use overly broad wildcard service patterns.",
      "remedies": ["Configure status.restricted_services with explicit required Google Cloud service names instead of wildcard service patterns."]
    },
    {
      "condition": "restricted_services must not be an empty list",
      "attribute_path": ["status", 0, "restricted_services"],
      "values": null,
      "policy_type": "blacklist"
    },
    {
      "condition": "restricted_services must not contain wildcard service patterns",
      "attribute_path": ["status", 0, "restricted_services"],
      "values": [".*\\*.*"],
      "policy_type": "pattern blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
