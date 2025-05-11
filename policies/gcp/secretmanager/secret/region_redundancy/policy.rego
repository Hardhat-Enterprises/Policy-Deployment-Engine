package terraform.gcp.security.secretmanager.secret.region_redundancy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secretmanager.secret.vars

conditions := [
  [
    {
      "situation_description": "Secret uses user-managed replication with fewer than 2 replica regions",
      "remedies": ["Add at least 2 replica regions under user-managed replication"]
    },
    {
      "condition": "Ensure at least 2 replica regions for user-managed replication",
      "attribute_path": ["replication", "user_managed", 0, "replicas"],
      "values": [2, null],
      "policy_type": "range"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
