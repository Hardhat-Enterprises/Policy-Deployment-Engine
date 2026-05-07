package terraform.gcp.security.managed_kafka.google_managed_kafka_connect_cluster.cluster_binding

import data.terraform.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_connect_cluster.vars

conditions := [
    # SCENARIO 1 — vCPU must be >= 3
    [
        {
            "situation_description": "Connectors must have sufficient vCPU to ensure performance.",
            "remedies": ["Set vCPU count to 3 or more."]
        },
        {
            "condition": "vcpu_count must be >= 3",
            "attribute_path": ["capacity_config", 0, "vcpu_count"],
            "values": [3, 16],
            "policy_type": "range"
        }
    ],

    # SCENARIO 2 — Memory must be >= 3GB
    [
        {
            "situation_description": "Connectors must have sufficient memory to ensure stability.",
            "remedies": ["Set memory_bytes to 3GB or more."]
        },
        {
            "condition": "memory_bytes must be >= 3GB",
            "attribute_path": ["capacity_config", 0, "memory_bytes"],
            "values": [3221225472, 17179869184],
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details