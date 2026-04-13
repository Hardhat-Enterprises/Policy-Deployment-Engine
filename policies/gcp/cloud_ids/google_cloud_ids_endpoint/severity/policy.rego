package terraform.gcp.security.cloud_ids.google_cloud_ids_endpoint.severity

import data.terraform.helpers
import data.terraform.gcp.security.cloud_ids.google_cloud_ids_endpoint.vars

conditions := [
  [
    {
      "situation_description": "IDS endpoint is using weak severity level",
      "remedies": ["Set severity to HIGH or CRITICAL"]
    },
    {
      "condition": "Weak severity detected",
      "attribute_path": ["severity"],
      "values": ["LOW", "MEDIUM", "INFORMATIONAL"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details