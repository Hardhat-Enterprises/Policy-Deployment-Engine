package terraform.gcp.security.managed_kafka.google_managed_kafka_connect_cluster.cluster_binding 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_connect_cluster.vars

conditions := [

    # SCENARIO 1 — Disallow public-facing DNS domains
    [
        {
            "situation_description": "Kafka Connect clusters must not expose public DNS domains (e.g., *.cloud.goog) for privacy and security.",
            "remedies": [
                "Remove or replace public DNS domain names like *.cloud.goog.",
                "Use internal or private domain names to restrict exposure."
            ]
        },
        {
            "condition": "DNS domain names must not be public (e.g., cloud.goog)",
            "attribute_path": ["gcp_config", "access_config", "network_configs", "dns_domain_names"],
            "values": ["internal.example.local", "corp.internal", "svc.cluster.local"],
            "policy_type": "whitelist"
        }
    ],

    # SCENARIO 2 — Enforce minimum vCPU for Kafka Connect cluster
    [
        {
            "situation_description": "Kafka Connect clusters must be provisioned with sufficient compute resources (minimum 3 vCPU) to ensure stability.",
            "remedies": [
                "Increase vCPU to at least 3 in the capacity_config block."
            ]
        },
        {
            "condition": "Minimum vCPU requirement",
            "attribute_path": ["capacity_config", "vcpu_count"],
            "values": [3, 4, 6, 8],
            "policy_type": "whitelist"
        }
    ],

    # SCENARIO 3 — Enforce minimum memory (>= 3 GiB)
    [
        {
            "situation_description": "Kafka Connect clusters must have at least 3 GiB of memory (3221225472 bytes) to function securely and efficiently.",
            "remedies": [
                "Set memory_bytes to a minimum of 3221225472 (3 GiB) or higher."
            ]
        },
        {
            "condition": "Minimum memory allocation requirement",
            "attribute_path": ["capacity_config", "memory_bytes"],
            "values": [3221225472, 4294967296, 8589934592],
            "policy_type": "whitelist"
        }
    ]
]

summary := {
    "message": helpers.get_multi_summary(conditions, vars.variables).message,
    "details": helpers.get_multi_summary(conditions, vars.variables).details
}