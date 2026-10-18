package terraform.gcp.security.app_engine.google_app_engine_application.ssl_policy

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_application.vars

conditions := [
  [
    {
      "situation_description": "App Engine Application is using an unspecified SSL policy",
      "remedies": ["Ensure ssl_policy is set to DEFAULT or MODERN"]
    },
    {
      "condition": "Blacklist SSL_POLICY_UNSPECIFIED",
      "attribute_path": ["ssl_policy"],
      "values": ["SSL_POLICY_UNSPECIFIED"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details