package terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.api_config_login
import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.vars

conditions := [
  [
    {
      "situation_description" : "The Endpoints API config should require login, not leave it optional",
      "remedies":[
        "Set api_config.login to LOGIN_REQUIRED or LOGIN_ADMIN"
      ]
    },
    {
      "condition": "c1 api_config login is LOGIN_REQUIRED or LOGIN_ADMIN",
      "attribute_path" : ["api_config", 0, "login"],
      "values" : ["LOGIN_REQUIRED", "LOGIN_ADMIN"],
      "policy_type" : "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
