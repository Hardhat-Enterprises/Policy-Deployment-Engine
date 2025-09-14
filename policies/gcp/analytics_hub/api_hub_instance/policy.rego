package terraform.gcp.security.analytics_hub.data_exchange.naming_standard

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.data_exchange.vars

# STEP 1: Define the conditions for naming standard
conditions := [
  [
    {
      "situation_description": "The display_name does not follow the required naming convention.",
      "remedies": [
        "Ensure the display_name starts with the prefix 'de-'"
      ]
    },
    {
      "condition": "Check if display_name starts with 'de-'",
      "attribute_path": ["display_name"],
      "values": ["de-*"],
      "policy_type": "pattern whitelist"
    }
  ]
]

# Displays a general message about policy compliance
# Use: opa eval ... "data.terraform.gcp.security.analytics_hub.data_exchange.naming_standard.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resource's compliance to every condition
# Use: opa eval ... "data.terraform.gcp.security.analytics_hub.data_exchange.naming_standard.details"
details := helpers.get_multi_summary(conditions, vars.variables).details
