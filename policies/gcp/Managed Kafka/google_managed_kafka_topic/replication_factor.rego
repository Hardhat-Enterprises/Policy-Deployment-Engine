package terraform.gcp.security.managed_kafka.google_managed_kafka_topic.replication_factor

import data.terraform.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_topic.vars

conditions := [
    [
        {
            "situation_description": "Managed Kafka topic replication_factor is below the recommended minimum of 3, increasing the risk of data loss if a broker fails.",
            "remedies": [
                "Set replication_factor to at least 3 for production topics.",
                "A replication factor of 3 is Google's recommended minimum for high availability."
            ]
        },
        {
            "condition": "Check if replication_factor is within the approved range",
            "attribute_path": ["replication_factor"],
            "values": [3, 10],
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details