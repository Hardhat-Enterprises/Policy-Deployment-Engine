package terraform.gcp.security.managed_kafka.google_managed_kafka_connect_cluster.cluster_binding

import data.terraform.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_connect_cluster.vars

conditions := [

    # SCENARIO 1 — Connector must be associated with a connect cluster
    [
        {
            "situation_description": "Kafka Connect connectors must be linked to a valid Connect Cluster.",
            "remedies": ["Set connect_cluster to a valid cluster name."]
        },
        {
            "condition": "connect_cluster must be defined",
            "attribute_path": ["connect_cluster"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ],

    # SCENARIO 2 — vCPU must be >= 2
    [
        {
            "situation_description": "Connectors must have sufficient vCPU to ensure performance.",
            "remedies": ["Set vCPU count to 2 or more."]
        },
        {
            "condition": "vcpu_count must be >= 2",
            "attribute_path": ["capacity_config", "vcpu_count"],
            "values": [2, 4, 8, 16, 32, 64, 96, 128],
            "policy_type": "whitelist"
        }
    ],

    # SCENARIO 3 — Memory must be >= 2GB
    [
        {
            "situation_description": "Connectors must have sufficient memory to ensure stability.",
            "remedies": ["Set memory_bytes to 2GB or more."]
        },
        {
            "condition": "memory_bytes must be >= 2GB",
            "attribute_path": ["capacity_config", "memory_bytes"],
            "values": [2147483648, 4294967296, 8589934592, 17179869184],
            "policy_type": "whitelist"
        }
    ]
]

summary := {
    "message": helpers.get_multi_summary(conditions, vars.variables).message,
    "details": helpers.get_multi_summary(conditions, vars.variables).details
}
