package terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function.timeout

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function.vars

conditions := [
  [
    {"situation_description" : "Check if timeout_seconds is between 120 and 300 seconds",
    "remedies":[ "Ensure timeout_seconds is 120,300 seconds"]},
    {
        "condition": "Test if timeout_seconds  is within 120 to 300 seconds",
        "attribute_path" : ["service_config", 0, "timeout_seconds"],
        "values" : [120,300],
        "policy_type" : "range" 
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details