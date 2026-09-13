package terraform.gcp.security.parallelstore.google_parallelstore_instance.location

import data.terraform.helpers
import data.terraform.gcp.security.parallelstore.google_parallelstore_instance.vars

conditions := [
  [
    {
      "situation_description": "Parallelstore instance must be deployed in australia-southeast1",
      "remedies": ["Set location to australia-southeast1"]
    },
    {
      "condition": "Location whitelist",
      "attribute_path": ["location"],
      "values": ["australia-southeast1"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
