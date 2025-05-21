package terraform.gcp.security.access_manager.google_access_context_manager_service_perimeter.perimeter_type

import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_manager.google_access_context_manager_service_perimeter.perimeter_type.vars

conditions := [
  [
    {"situation_description": "Perimeter type is set to less secure 'BRIDGE'",
     "remedies": ["Use 'PERIMETER_TYPE_REGULAR' for secure perimeters"]},
    {
      "condition": "Ensure perimeter_type is 'PERIMETER_TYPE_REGULAR'",
      "attribute_path": ["perimeter_type"],
      "values": ["PERIMETER_TYPE_REGULAR"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details