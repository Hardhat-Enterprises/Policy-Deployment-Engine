package terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.handlers_login
import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.vars

conditions := [
  [
    {
      "situation_description" : "URL handlers should require login, not leave it optional",
      "remedies":[
        "Set handlers.login to LOGIN_REQUIRED or LOGIN_ADMIN"
      ]
    },
    {
      "condition": "c1 handlers login is LOGIN_REQUIRED or LOGIN_ADMIN",
      "attribute_path" : ["handlers", 0, "login"],
      "values" : ["LOGIN_REQUIRED", "LOGIN_ADMIN"],
      "policy_type" : "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
