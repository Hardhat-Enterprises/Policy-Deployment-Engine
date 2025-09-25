package terraform.gcp.security.managed_kafka.google_managed_kafka_cluster.kafka_mtls_enforcement
import data.terraform.gcp.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_cluster.vars


conditions := [
     # SCENARIO 1 - Enforce mTLS
    [   
        {"situation_description": "Kafka clusters must enforce mutual TLS (mTLS) authentication.",
         "remedies": ["Enable mTLS by configuring tls_config.trust_config.cas_configs with a valid CA pool."]},
        {
            "condition": "tls_config.trust_config.cas_configs must be properly defined",
            "attribute_path": ["tls_config", "trust_config", "cas_configs", 0, "ca_pool"],
            "values": ["projects/my-project/locations/us-central1/caPools/my-ca-pool"],
            "policy_type": "whitelist"
        }
    ],

    # SCENARIO 2 — TLS config must not be empty

    [
        {"situation_description": "Clusters without tls_config are vulnerable to plain-text data transmission.",
         "remedies": ["Always define tls_config with CA pools and trust settings."]},
        {
            "condition": "tls_config must be configured",
            "attribute_path": ["tls_config"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ]

]
summary := {
    "message": helpers.get_multi_summary(conditions, vars.variables).message,
    "details": helpers.get_multi_summary(conditions, vars.variables).details
}
