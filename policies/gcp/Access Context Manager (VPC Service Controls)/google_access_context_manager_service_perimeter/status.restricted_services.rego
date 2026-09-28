package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.status_restricted_services

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars

conditions := [
  [
    {
      "situation_description": "Restricted services should explicitly identify protected Google Cloud services and must not use overly broad wildcard service entries.",
      "remedies": ["Configure status.restricted_services with explicit required Google Cloud service names instead of wildcard service entries."]
    },
    {
      "condition": "restricted_services must not be an empty list",
      "attribute_path": ["status", 0, "restricted_services"],
      "values": null,
      "policy_type": "blacklist"
    },
    {
      "condition": "restricted_services must not contain overly broad wildcard service entries",
      "attribute_path": ["status", 0, "restricted_services"],
      "values": ["*", "*.googleapis.com"],
      "policy_type": "element blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
