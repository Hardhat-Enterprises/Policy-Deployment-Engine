package terraform.gcp.security.access_context_manager.google_access_context_manager_access_level.combining_function

import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_context_manager.google_access_context_manager_access_level.vars

conditions := [

  # Enforce combining_function = "AND"
  [
    {
      "situation_description": "Combining function must be set to 'AND' to enforce multiple condition checks.",
      "remedies": ["Set combining_function to 'AND'."]
    },
    {
      "condition": "Combining function must be 'AND'",
      "attribute_path": ["basic", "combining_function"],
      "values": ["AND"],
      "policy_type": "whitelist"
    }
  ],

  # Ensure at least two fields are defined in 'conditions'
  [
    {
      "situation_description": "Only one condition is present, making the combining_function ineffective.",
      "remedies": ["Add another condition like 'regions', 'ip_subnetworks', or 'device_policy'."]
    },
    {
      "condition": "Check that conditions block has at least 2 fields.",
      "attribute_path": ["basic", "conditions"],
      "values": [2],
      "policy_type": "min_length"
    }
  ],

  # Optionally enforce that 'regions' (if defined) use approved values
  [
    {
      "situation_description": "Region must be set to an approved geographic code (e.g., AU, US, IN).",
      "remedies": ["Update the 'regions' field to use one of the approved ISO country codes."]
    },
    {
      "condition": "Validate 'regions' values against allowed list.",
      "attribute_path": ["basic", "conditions", "regions", 0],
      "values": ["AU", "US", "IN"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
