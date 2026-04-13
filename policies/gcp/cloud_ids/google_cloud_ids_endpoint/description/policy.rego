package terraform.gcp.security.cloud_ids.google_cloud_ids_endpoint.description

import data.terraform.helpers
import data.terraform.gcp.security.cloud_ids.google_cloud_ids_endpoint.vars

conditions := [
  [
    {
      "situation_description": "IDS endpoint description is not production",
      "remedies": ["Set description to 'prod'"]
    },
    {
      "condition": "Invalid description detected",
      "attribute_path": ["description"],
      "values": ["prod"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details