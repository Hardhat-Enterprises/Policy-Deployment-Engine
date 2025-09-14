package terraform.gcp.security.blockchain_node_engine.blockchain_nodes.naming_standard

import data.terraform.gcp.helpers
import data.terraform.gcp.security.blockchain_node_engine.blockchain_nodes.vars

# STEP 1: Define the naming standard conditions
conditions := [
  [
    {
      "situation_description": "The blockchain_node_id does not follow the required naming convention.",
      "remedies": [
        "Ensure blockchain_node_id only contains lowercase letters, numbers, and hyphens"
      ]
    },
    {
      "condition": "Check if blockchain_node_id matches '^[a-z0-9\\-]+$'",
      "attribute_path": ["blockchain_node_id"],
      "values": ["^[a-z0-9\\-]+$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

# Displays a general message about policy compliance
# Example: opa eval ... "data.terraform.gcp.security.blockchain_node_engine.blockchain_nodes.naming_standard.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resource's compliance to every condition
# Example: opa eval ... "data.terraform.gcp.security.blockchain_node_engine.blockchain_nodes.naming_standard.details"
details := helpers.get_multi_summary(conditions, vars.variables).details
