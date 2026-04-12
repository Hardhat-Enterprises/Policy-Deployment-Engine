package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.require_admin_approval

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars

conditions := [
  [
    {
      "situation_description": "Ensure that administrative approval is required before allowing device access to enhance security control.",
      "remedies": ["Enable require_admin_approval to ensure only approved devices can access the service."]
    },
    {
      "condition": "administrative approval must be enforced",
      "attribute_path": ["basic", 0, "conditions", 0, "device_policy", 0, "require_admin_approval"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details