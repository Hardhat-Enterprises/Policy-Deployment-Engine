package terraform.gcp.security.managed_kafka.google_managed_kafka_topic.location

import data.terraform.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_topic.vars

conditions := [
    [
        {
            "situation_description": "Managed Kafka topic location is outside the approved Australian region.",
            "remedies": [
                "Set the topic location to australia-southeast1.",
                "Use approved Australian regions to support data residency and regional governance requirements."
            ]
        },
        {
            "condition": "Managed Kafka topic location must be australia-southeast1",
            "attribute_path": ["location"],
            "values": ["australia-southeast1"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details