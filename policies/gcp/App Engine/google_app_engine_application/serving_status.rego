package terraform.gcp.security.app_engine.google_app_engine_application.serving_status

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_application.vars

conditions := [
  [
    {
      "situation_description": "App Engine application is not serving traffic",
      "remedies": ["Please set serving_status to SERVING for the App Engine application"]
    },
    {
      "condition": "Ensure that application is serving traffic",
      "attribute_path": ["serving_status"],
      "values": ["SERVING"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details