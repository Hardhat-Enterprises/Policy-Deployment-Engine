package terraform.gcp.security.managed_kafka.google_managed_kafka_connect_cluster.enforce_private_networking
import data.terraform.gcp.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_connect_cluster.vars

conditions := [

    # SCENARIO 1 — Enforce Private Networking for Kafka Connect Clusters
    [
        {
            "situation_description": "Kafka Connect clusters must only use private networking to avoid exposure to the public internet.",
            "remedies": [
                "Set network_config.private_connectivity to true.",
                "Ensure public_endpoint is disabled in the network configuration."
            ]
        },
        {
            "condition": "Private networking must be enabled for Kafka Connect",
            "attribute_path": ["network_config", "private_connectivity"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ],

    # SCENARIO 2 — Restrict Public Endpoint
    [
        {
            "situation_description": "Public endpoints for Kafka Connect clusters must be disabled to prevent unauthorized access.",
            "remedies": ["Ensure network_config.public_endpoint is set to false."]
        },
        {
            "condition": "Public endpoints must be disabled",
            "attribute_path": ["network_config", "public_endpoint"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

summary := {
    "message": helpers.get_multi_summary(conditions, vars.variables).message,
    "details": helpers.get_multi_summary(conditions, vars.variables).details
}
