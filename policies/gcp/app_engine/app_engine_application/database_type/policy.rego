package terraform.gcp.security.app_engine.app_engine_application.database_type

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.app_engine_application.vars

conditions := [
  [
    {
      "situation_description": "App Engine application is utilising a database type that is not allowed",
      "remedies": ["Use CLOUD_FIRESTORE as the database type for App Engine applications"]
    },
    {
      "condition": "Whitelist approved database type",
      "attribute_path": ["database_type"],
      "values": ["CLOUD_FIRESTORE"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details