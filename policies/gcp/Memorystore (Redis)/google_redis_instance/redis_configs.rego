package terraform.gcp.security.memorystore_redis.google_redis_instance.redis_configs

import data.terraform.helpers
import data.terraform.gcp.security.memorystore_redis.google_redis_instance.vars

conditions := [
  [
    {
      "situation_description": "Redis configuration enables insecure command behavior.",
      "remedies": [
        "Remove insecure Redis configuration values and keep dangerous commands disabled."
      ]
    },
    {
      "condition": "redis_configs must not enable dangerous commands.",
      "attribute_path": ["redis_configs", "enable-debug-command"],
      "values": ["yes"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details