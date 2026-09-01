package terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.delete_service_on_destroy
import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.vars

conditions := [
  [
    {
      "situation_description" : "The underlying service should not be destroyed automatically when its last version is destroyed",
      "remedies":[
        "Set delete_service_on_destroy to false"
      ]
    },
    {
      "condition": "c1 delete_service_on_destroy is false",
      "attribute_path" : ["delete_service_on_destroy"],
      "values" : [false],
      "policy_type" : "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
