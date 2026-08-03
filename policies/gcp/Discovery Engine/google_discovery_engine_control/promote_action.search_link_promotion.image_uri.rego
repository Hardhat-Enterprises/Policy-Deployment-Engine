package terraform.gcp.security.discovery_engine.google_discovery_engine_control.promote_action_search_link_promotion_image_uri

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_control.vars

# Restrict promoted images to an approved HTTPS location.

conditions := [
  [
    {
      "situation_description": "Does the promoted image URI use HTTPS?",
      "remedies": ["Use the HTTPS scheme for the promoted image URI."]
    },
    {
      "condition": "promoted image URI does not use HTTPS",
      "attribute_path": ["promote_action", 0, "search_link_promotion", 0, "image_uri"],
      "values": ["https://*"],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details