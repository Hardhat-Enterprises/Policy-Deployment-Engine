package terraform.gcp.security.managed_kafka.google_managed_kafka_topic.secure_topic_config

import data.terraform.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_topic.vars

conditions := [


  # SITUATION 1 – Minimum replication factor using range

  [
    {
      "situation_description": "Kafka topics should have a replication factor of at least 3 for high availability.",
      "remedies": ["Set replication_factor to 3 or more for better redundancy."]
    },
    {
      "condition": "replication_factor must be at least 3",
      "attribute_path": ["replication_factor"],
      "values": [3],
      "policy_type": "whitelist"

    }
  ],

  # SITUATION 2 – Disallow replication_factor of 1
  [
    {
      "situation_description": "Kafka topics with replication_factor = 1 have no redundancy.",
      "remedies": ["Increase replication_factor to avoid data loss risks."]
    },
    {
      "condition": "replication_factor must not be 1",
      "attribute_path": ["replication_factor"],
      "values": [1],
      "policy_type": "blacklist"
    }
  ],

  # SITUATION 3 – Retention must be at least 7 days
  [
    {
      "situation_description": "Kafka topics should retain logs for at least 7 days for auditing and recovery.",
      "remedies": ["Set retention.ms to 604800000 (7 days) or higher."]
    },
    {
      "condition": "retention.ms must be at least 7 days",
      "attribute_path": ["configs", "retention.ms"],
      "values": ["604800000", "1209600000", "2592000000"],
      "policy_type": "whitelist"
    }
  ],

  # SITUATION 4 – Enforce cleanup.policy = delete
  [
    {
      "situation_description": "Kafka topics should use 'delete' as cleanup.policy unless compaction is explicitly needed.",
      "remedies": ["Use cleanup.policy = 'delete' to automatically remove old log segments."]
    },
    {
      "condition": "cleanup.policy must be 'delete'",
      "attribute_path": ["configs", "cleanup.policy"],
      "values": ["delete"],
      "policy_type": "whitelist"
    }
  ],

  # SITUATION 5 – Disallow cleanup.policy = compact
  [
    {
      "situation_description": "Kafka topics should not use 'compact' unless there is a clear reason.",
      "remedies": ["Avoid using cleanup.policy = 'compact' unless needed."]
    },
    {
      "condition": "cleanup.policy must not be 'compact'",
      "attribute_path": ["configs", "cleanup.policy"],
      "values": ["compact"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details