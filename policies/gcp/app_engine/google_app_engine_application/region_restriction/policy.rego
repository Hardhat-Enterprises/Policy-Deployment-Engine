package terraform.gcp.security.app_engine.google_app_engine_application.region_restriction

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_application.region_restriction.vars

conditions := [
  [
    {
      "situation_description": "Deployment is using an unapproved region",
      "remedies": [
        "Update the region to an allowed one such as us-central or europe-west"
      ]
    },
    {
      "condition": "Region must be in allowed list",
      "attribute_path": ["location_id"],
      "values": ["us-central", "us-east1", "europe-west1", "asia-southeast1"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
