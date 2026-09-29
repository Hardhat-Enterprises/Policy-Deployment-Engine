package terraform.gcp.security.memorystore_redis.google_redis_instance.location_id

import data.terraform.helpers
import data.terraform.gcp.security.memorystore_redis.google_redis_instance.vars

conditions := [
  [
    {
      "situation_description": "Redis is deployed outside the approved Australian zones.",
      "remedies": [
        "Set location_id to an approved Australian zone."
      ]
    },
    {
      "condition": "location_id must use an approved Australian zone.",
      "attribute_path": ["location_id"],
      "values": [
        "australia-southeast1-a",
        "australia-southeast1-b",
        "australia-southeast1-c",
        "australia-southeast2-a",
        "australia-southeast2-b",
        "australia-southeast2-c"
      ],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details