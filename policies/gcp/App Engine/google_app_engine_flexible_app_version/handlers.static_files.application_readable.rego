package terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.handlers.static_files.application_readable
import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.vars

conditions := [
  [
    {
      "situation_description" : "Static files should not also be exposed as readable application code",
      "remedies":[
        "Set handlers.static_files.application_readable to false"
      ]
    },
    {
      "condition": "c1 application_readable is false",
      "attribute_path" : ["handlers", 0, "static_files", 0, "application_readable"],
      "values" : [false],
      "policy_type" : "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
