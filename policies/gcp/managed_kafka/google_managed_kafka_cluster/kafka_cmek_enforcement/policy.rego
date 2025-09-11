package terraform.gcp.security.managed_kafka.google_managed_kafka_cluster.kafka_cmek_enforcement
import data.terraform.gcp.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_cluster.vars
conditions := [
    
       # SCENARIO 1 — Enforce CMEK usage
    [
        {"situation_description": "Kafka data must be encrypted using Customer-Managed Encryption Keys (CMEK).",
         "remedies": ["Specify gcp_config.kms_key to enable CMEK for data encryption."]},
        {
            "condition": "CMEK must be enabled",
            "attribute_path": ["gcp_config", "kms_key"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ],
    
    # SCENARIO 2 — KMS key region must match cluster location
    [
        {"situation_description": "Kafka cluster and KMS key must be located in the same region for compliance.",
         "remedies": ["Use a KMS key located in the same region as your Kafka cluster."]},
        {
            "condition": "KMS key must belong to the same region",
            "attribute_path": ["gcp_config", "kms_key"],
            "values": ["projects/my-project/locations/us-central1/keyRings/example-ring/cryptoKeys/example-key"],
            "policy_type": "whitelist"
        }
    ],
]

summary := {
    "message": helpers.get_multi_summary(conditions, vars.variables).message,
    "details": helpers.get_multi_summary(conditions, vars.variables).details
}