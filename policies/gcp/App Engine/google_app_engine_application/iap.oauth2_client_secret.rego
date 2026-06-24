package terraform.gcp.security.app_engine.google_app_engine_application.iap_oauth2_client_secret

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_application.vars

conditions := [
  [
    {
      "situation_description": "OAuth2 Client Secret is missing/invalid",
      "remedies": ["Please provide the valid client secret"]
    },
    {
      "condition": "Ensure client secret is not a placeholder",
      "attribute_path": ["iap", 0, "oauth2_client_secret"],
      "values": ["password", "12345"], 
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details