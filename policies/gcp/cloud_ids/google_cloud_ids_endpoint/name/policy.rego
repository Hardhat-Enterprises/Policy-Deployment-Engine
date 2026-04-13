package terraform.gcp.security.cloud_ids.google_cloud_ids_endpoint.name

import data.terraform.helpers
import data.terraform.gcp.security.cloud_ids.google_cloud_ids_endpoint.vars

conditions := [
  [
    {
      "situation_description": "Test endpoint names are not allowed",
      "remedies": ["Use production naming convention"]
    },
    {
      "condition": "Invalid name detected",
      "attribute_path": ["name"],
      "values": ["ids-test"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details