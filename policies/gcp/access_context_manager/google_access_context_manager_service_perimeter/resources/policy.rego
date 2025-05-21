package terraform.gcp.security.access_manager.google_access_context_manager_service_perimeter.resources

import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_manager.google_access_context_manager_service_perimeter.resources.vars

conditions := [
  [
    {
      "situation_description": "Perimeter includes test or non-production resources.",
      "remedies": [
        "Exclude test projects from perimeter or create a separate dev perimeter."
      ]
    },
    {
      "condition": "Check if resource names contain 'test'.",
      "attribute_path": ["resources", 0],
      "values": [["test"]],
      "policy_type": "pattern blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
