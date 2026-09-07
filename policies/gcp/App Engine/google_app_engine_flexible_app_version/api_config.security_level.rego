package terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.api_config.security_level
import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.vars

conditions := [
  [
    {
      "situation_description" : "The Endpoints API config should enforce HTTPS",
      "remedies":[
        "Set api_config.security_level to SECURE_ALWAYS"
      ]
    },
    {
      "condition": "c1 api_config security_level is SECURE_ALWAYS",
      "attribute_path" : ["api_config", 0, "security_level"],
      "values" : ["SECURE_ALWAYS"],
      "policy_type" : "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
