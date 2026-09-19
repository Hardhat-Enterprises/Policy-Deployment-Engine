package terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.noop_on_destroy
import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.vars

conditions := [
  [
    {
      "situation_description" : "The application version should not be silently deleted",
      "remedies":[
        "Set noop_on_destroy to true"
      ]
    },
    {
      "condition": "c1 noop_on_destroy is true",
      "attribute_path" : ["noop_on_destroy"],
      "values" : [true],
      "policy_type" : "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
