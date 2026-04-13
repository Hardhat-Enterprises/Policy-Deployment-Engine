package terraform.gcp.security.managed_kafka.google_managed_kafka_connect_cluster.disallow_public_exposure

import data.terraform.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_connect_cluster.vars

conditions := [

    # SCENARIO 1 — Enforce use of private subnets using pattern whitelist
    [
        {
            "situation_description": "Kafka Connect clusters should only use private subnets from known project/region patterns.",
            "remedies": [
                "Ensure the subnet follows expected private patterns, e.g., private-subnet-1."
            ]
        },
        {
            "condition": "Only private subnetworks from allowed regions/projects may be used",
            "attribute_path": ["gcp_config", 0, "access_config", 0, "network_configs", 0, "primary_subnet"],
            "values": [
                "projects/*/regions/*/subnetworks/*",
                [
                    ["c", "kafka-project"],
                    ["us-central1", "australia-southeast1"],
                    ["private-subnet-1", "private-subnet-2"]
                ]
            ],
            "policy_type": "Pattern Whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details