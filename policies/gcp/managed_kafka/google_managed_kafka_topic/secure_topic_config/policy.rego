package terraform.gcp.security.managed_kafka.google_managed_kafka_topic.secure_topic_config
import data.terraform.gcp.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_topic.vars

conditions := [
    [
        {
            "situation_description": "Enforce secure configurations for Kafka topics to prevent data loss, ensure availability, and retain critical logs.",
            "remedies": [
                "Use replication_factor = 3 to ensure fault tolerance.",
                "Ensure retention.ms is sufficiently large to retain logs for compliance and auditing.",
                "Use delete policy for cleanup unless compaction is explicitly required."
            ]
        },

        

        {
            "condition": "replication_factor must be 3",
            "attribute_path": ["replication_factor"],
            "values": [3],
            "policy_type": "whitelist"
        },
        {
            "condition": "retention.ms must be at least 7 days (604800000)",
            "attribute_path": ["configs", "retention.ms"],
            "values": ["604800000", "1209600000", "2592000000"],  # 7, 14, 30 days
            "policy_type": "whitelist"
        },
        {
            "condition": "cleanup.policy must be 'delete'",
            "attribute_path": ["configs", "cleanup.policy"],
            "values": ["delete"],
            "policy_type": "whitelist"
        },
        {
            "condition": "replication_factor must not be 1 (no redundancy)",
            "attribute_path": ["replication_factor"],
            "values": [1],
            "policy_type": "blacklist"
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