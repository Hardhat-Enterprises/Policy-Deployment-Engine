package terraform.gcp.security.memorystore_redis.google_redis_instance.deletion_protection

import data.terraform.helpers
import data.terraform.gcp.security.memorystore_redis.google_redis_instance.vars

conditions := [
  [
    {
      "situation_description": "Deletion protection is disabled for the Redis instance.",
      "remedies": [
        "Set deletion_protection to true."
      ]
    },
    {
      "condition": "deletion_protection must be enabled.",
      "attribute_path": ["deletion_protection"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details