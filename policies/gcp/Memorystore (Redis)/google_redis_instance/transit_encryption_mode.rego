package terraform.gcp.security.memorystore_redis.google_redis_instance.transit_encryption_mode

import data.terraform.helpers
import data.terraform.gcp.security.memorystore_redis.google_redis_instance.vars

conditions := [
  [
    {
      "situation_description": "Redis client-to-server traffic encryption is disabled.",
      "remedies": [
        "Set transit_encryption_mode to SERVER_AUTHENTICATION."
      ]
    },
    {
      "condition": "transit_encryption_mode must require encrypted client-to-server traffic.",
      "attribute_path": ["transit_encryption_mode"],
      "values": ["SERVER_AUTHENTICATION"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details