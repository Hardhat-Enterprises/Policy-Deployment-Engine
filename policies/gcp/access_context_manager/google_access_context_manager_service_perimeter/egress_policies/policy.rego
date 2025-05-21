package terraform.gcp.security.access_manager.google_access_context_manager_service_perimeter.egress_policies

import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_manager.google_access_context_manager_service_perimeter.egress_policies.vars

conditions := [

  # Validate identities come from the organizational domain
  [
    {
      "situation_description": "Egress policy allows public access or wildcard resource usage.",
      "remedies": [
        "Restrict identities and avoid wildcard '*' in resources"
      ]
    },
    {
      "condition": "Ensure egress_from.identities are organizational users and not public.",
      "attribute_path": ["egress_policies", 0, "egress_from", 0, "identities", 0],
      "values": [["@deakin.edu.au"]],
      "policy_type": "pattern whitelist"
    }
  ],

  # Prevent wildcard use in resources
  [
    {
      "situation_description": "Egress policy uses wildcard '*' in resources.",
      "remedies": [
        "Specify exact project/resource instead of '*'"
      ]
    },
    {
      "condition": "Disallow wildcard resources in egress_to.",
      "attribute_path": ["egress_policies", 0, "egress_to", 0, "resources", 0],
      "values": ["*"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
