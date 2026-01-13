package terraform.gcp.security.app_hub.google_apphub_application.scope_type
import data.terraform.helpers
import data.terraform.gcp.security.app_hub.google_apphub_application.vars

conditions := [
    [
      {"situation_description" : "Scope of app is suggested to be REGIONAL.",
      "remedies":[ "Set scope_type to REGIONAL only"]},
      {
          "condition": "Check if scope_type is allowed",
          "attribute_path" : ["scope", "type"], 
          "values" : ["REGIONAL"], 
          "policy_type" : "whitelist" 
      }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details