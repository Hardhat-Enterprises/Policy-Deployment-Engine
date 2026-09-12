package terraform.gcp.security.memorystore_redis.google_redis_instance.connect_mode

import data.terraform.helpers
import data.terraform.gcp.security.memorystore_redis.google_redis_instance.vars

conditions := [
  [
    {
      "situation_description": "Redis is not using the approved private connectivity mode.",
      "remedies": [
        "Set connect_mode to PRIVATE_SERVICE_ACCESS."
      ]
    },
    {
      "condition": "connect_mode must use private service access.",
      "attribute_path": ["connect_mode"],
      "values": ["PRIVATE_SERVICE_ACCESS"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details