package terraform.gcp.security.container_analysis.note.naming_standard

import data.terraform.gcp.helpers
import data.terraform.gcp.security.container_analysis.note.vars

# STEP 1: Define the naming standard conditions
conditions := [
  [
    {
      "situation_description": "The container analysis note name does not follow the required naming convention.",
      "remedies": [
        "Ensure the name only contains lowercase letters, numbers, and hyphens"
      ]
    },
    {
      "condition": "Check if note name matches '^[a-z0-9-]+$'",
      "attribute_path": ["name"],
      "values": ["^[a-z0-9-]+$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

# Displays a general message about policy compliance
# Example: opa eval ... "data.terraform.gcp.security.container_analysis.note.naming_standard.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resource's compliance to every condition
# Example: opa eval ... "data.terraform.gcp.security.container_analysis.note.naming_standard.details"
details := helpers.get_multi_summary(conditions, vars.variables).details
