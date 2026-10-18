package terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.service_account
import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.vars

conditions := [
  [
    {
      "situation_description" : "The app version should run under an explicitly assigned service account rather than falling back to the broad default App Engine identity",
      "remedies":[
        "Set service_account to an explicitly assigned identity"
      ]
    },
    {
      "condition": "c1 service_account is set",
      "attribute_path" : ["service_account"],
      "values" : [null],
      "policy_type" : "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
