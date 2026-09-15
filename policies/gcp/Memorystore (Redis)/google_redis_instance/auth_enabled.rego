package terraform.gcp.security.memorystore_redis.google_redis_instance.auth_enabled

import data.terraform.helpers
import data.terraform.gcp.security.memorystore_redis.google_redis_instance.vars

conditions := [
  [
    {
      "situation_description": "Redis AUTH is disabled, allowing unauthenticated client access.",
      "remedies": [
        "Set auth_enabled to true."
      ]
    },
    {
      "condition": "Redis AUTH must be enabled.",
      "attribute_path": ["auth_enabled"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details