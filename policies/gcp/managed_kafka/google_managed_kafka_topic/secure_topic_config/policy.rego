package terraform.gcp.security.managed_kafka.google_managed_kafka_topic.secure_topic_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_topic.vars

conditions := [

  # SITUATION 1 – Replication factor must be 3
  [
    {
      "situation_description": "Kafka topics should have a replication factor of 3 for high availability.",
      "remedies": ["Set replication_factor = 3 to ensure fault tolerance."]
    },
    {
      "condition": "replication_factor must be 3",
      "attribute_path": ["replication_factor"],
      "values": [3],
      "policy_type": "whitelist"
    },
    {
      "condition": "replication_factor must not be 1 (no redundancy)",
      "attribute_path": ["replication_factor"],
      "values": [1],
      "policy_type": "blacklist"
    }
  ],

  # SITUATION 2 – Retention must be at least 7 days
  [
    {
      "situation_description": "Kafka topics should retain logs for at least 7 days for auditing and recovery.",
      "remedies": ["Set retention.ms to at least 604800000 (7 days) or higher."]
    },
    {
      "condition": "retention.ms must be at least 7 days",
      "attribute_path": ["configs", "retention.ms"],
      "values": ["604800000", "1209600000", "2592000000"],
      "policy_type": "whitelist"
    }
  ],

  # SITUATION 3 – Cleanup policy should be 'delete'
  [
    {
      "situation_description": "Cleanup policy should be 'delete' to ensure topics don’t retain stale data unless compaction is explicitly needed.",
      "remedies": ["Use cleanup.policy = 'delete' unless compaction is required."]
    },
    {
      "condition": "cleanup.policy must be 'delete'",
      "attribute_path": ["configs", "cleanup.policy"],
      "values": ["delete"],
      "policy_type": "whitelist"
    },
    {
      "condition": "cleanup.policy must not be 'compact' unless explicitly needed",
      "attribute_path": ["configs", "cleanup.policy"],
      "values": ["compact"],
      "policy_type": "blacklist"
    }
  ]
]

summary := {
  "message": helpers.get_multi_summary(conditions, vars.variables).message,
  "details": helpers.get_multi_summary(conditions, vars.variables).details
}
