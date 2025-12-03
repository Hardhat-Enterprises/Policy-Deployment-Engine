package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.region

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars

conditions := [
    [
    {
      "situation_description": "Ensure restricted services is not empty (no protection) or to general.",
      "remedies": ["Update status/restricted_services to explicitly include only required service calls."]
    },
    {
      "condition": "restricted_services is not an empty list",
      "attribute_path": ["status", 0, "restricted_services"],
      "values": null,
      "policy_type": "blacklist"
    },
    {
      "condition": "restricted_services is too permissive",
      "attribute_path": ["status", 0, "restricted_services"],
      "values": ["*"],
      "policy_type": "element blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details