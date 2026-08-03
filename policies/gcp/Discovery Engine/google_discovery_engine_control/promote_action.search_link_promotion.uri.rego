package terraform.gcp.security.discovery_engine.google_discovery_engine_control.promote_action_search_link_promotion_uri

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_control.vars

# Restrict promoted links to an approved HTTPS destination.

conditions := [
  [
    {
      "situation_description": "Does the promoted link use an approved destination URI?",
      "remedies": ["Use an approved HTTPS destination URI."]
    },
    {
      "condition": "promoted link URI is not approved",
      "attribute_path": ["promote_action", 0, "search_link_promotion", 0, "uri"],
      "values": ["https://goodexample.com/promotion"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details