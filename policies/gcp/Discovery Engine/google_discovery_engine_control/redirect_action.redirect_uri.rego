package terraform.gcp.security.discovery_engine.google_discovery_engine_control.redirect_action_redirect_uri
import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_control.vars

#engine_control_redirect_action

conditions := [
  [
    {
      "situation_description": "Does the redirect URI use HTTPS?",
      "remedies": ["Use the HTTPS scheme for the redirect URI."]
    },
    {
      "condition": "redirect URI does not use HTTPS",
      "attribute_path": ["redirect_action", 0, "redirect_uri"],
      "values": ["https://*"],
      "policy_type": "pattern whitelist"
    }
  ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
