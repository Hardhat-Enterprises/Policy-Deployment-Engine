package terraform.gcp.security.managed_kafka.google_managed_kafka_topic.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_topic.vars

conditions := [
    [
        {
            "situation_description": "The Managed Kafka topic does not have deletion protection enabled. Without it, the resource can be destroyed accidentally via terraform destroy or terraform apply.",
            "remedies": [
                "Set deletion_policy to PREVENT to block accidental deletion.",
                "Only relax to DELETE or ABANDON for short-lived, non-production topics."
            ]
        },
        {
            "condition": "Check if deletion_policy is set to PREVENT",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details