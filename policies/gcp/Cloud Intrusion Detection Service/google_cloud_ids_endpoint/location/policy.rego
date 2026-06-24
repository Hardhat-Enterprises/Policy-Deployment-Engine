package terraform.gcp.security.cloud_ids.google_cloud_ids_endpoint.location

import data.terraform.helpers
import data.terraform.gcp.security.cloud_ids.google_cloud_ids_endpoint.vars

conditions := [
  [
    {
      "situation_description": "IDS endpoint deployed outside Australia",
      "remedies": ["Deploy only in australia-southeast1"]
    },
    {
      "condition": "Invalid region detected",
      "attribute_path": ["location"],
      "values": ["australia-southeast1"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details