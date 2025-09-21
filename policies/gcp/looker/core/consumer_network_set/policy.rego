package terraform.gcp.security.looker.core.consumer_network_set
import data.terraform.gcp.helpers
import data.terraform.gcp.security.looker.core.vars

conditions := [
  [
    {
      "situation_description": "Consumer network required for private/PSC connectivity but not configured",
      "remedies": [
        "Configure consumer_network field for private connectivity",
        "Set consumer_network to a valid VPC network path",
        "Example: projects/PROJECT_ID/global/networks/NETWORK_NAME"
      ]
    },
    {
      "condition": "consumer_network must be set",
      "attribute_path": ["consumer_network"],
      "values": [null, ""], # Violates when missing or empty
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details