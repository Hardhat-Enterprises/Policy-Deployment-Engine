package terraform.gcp.security.app_hub.google_apphub_boundary.location
import data.terraform.helpers
import data.terraform.gcp.security.app_hub.google_apphub_boundary.vars

conditions := [
    [
      {"situation_description" : "App Hub must be able to globally discover/register components within a boundary.",
      "remedies":[ "Set location to 'global' only"]},
      {
          "condition": "Check if boundary's location is set as global",
          "attribute_path" : ["location"], 
          "values" : ["global"], 
          "policy_type" : "whitelist" 
      }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details