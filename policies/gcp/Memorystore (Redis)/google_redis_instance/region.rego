package terraform.gcp.security.memorystore_redis.google_redis_instance.region

import data.terraform.helpers
import data.terraform.gcp.security.memorystore_redis.google_redis_instance.vars

conditions := [
  [
    {
      "situation_description": "Redis is deployed outside the approved Australian regions.",
      "remedies": [
        "Set region to an approved Australian region."
      ]
    },
    {
      "condition": "region must use an approved Australian region.",
      "attribute_path": ["region"],
      "values": [
        "australia-southeast1",
        "australia-southeast2"
      ],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details