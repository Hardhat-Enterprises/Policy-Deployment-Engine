package terraform.gcp.security.app_engine.app_engine_application.oauth2_client_id

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.app_engine_application.vars

conditions := [
  [
    {
      "situation_description": "App Engine IAP is using an unapproved OAuth2 Client ID",
      "remedies": ["Ensure setting iap.oauth2_client_id to the approved Client ID"]
    },
    {
      "condition": "Whitelist approved OAuth2 Client ID",
      "attribute_path": ["iap", 0, "oauth2_client_id"],
      "values": ["12345.apps.googleusercontent.com"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details