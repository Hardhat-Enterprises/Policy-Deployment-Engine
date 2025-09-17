package terraform.gcp.security.managed_kafka.google_managed_kafka_cluster.kafka_cmek_enforcement

import data.terraform.gcp.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_cluster.vars

# Situation 1: Allowed locations (whitelist)
conditions := [
  [
    {
      "situation_description": "Kafka clusters should be deployed only in approved regions for compliance and security.",
      "remedies": ["Use one of the approved regions: us-central1, europe-west1, asia-southeast1."]
    },
    {
      "condition": "location must be in [\"us-central1\", \"europe-west1\", \"asia-southeast1\"]",
      "attribute_path": ["location"],
      "values": ["us-central1", "europe-west1", "asia-southeast1"],
      "policy_type": "whitelist"
    }
  ],
  
  # Situation 2: If region is not in allowed list, check if KMS key is in the same region (pattern match)
  [
    {
      "situation_description": "Kafka clusters using CMEK must use a KMS key in the same region.",
      "remedies": ["Use a CMEK key that resides in the same region as the cluster."]
    },
    {
      "condition": "location not in [\"us-central1\", \"europe-west1\", \"asia-southeast1\"]",
      "attribute_path": ["location"],
      "values": ["us-central1", "europe-west1", "asia-southeast1"],
      "policy_type": "blacklist"
    },
    {
      "condition": "kms_key must match pattern projects/*/locations/LOCATION/keyRings/*/cryptoKeys/*",
      "attribute_path": ["encryption_config", "kms_key"],
      "values": ["projects/*/locations/*/keyRings/*/cryptoKeys/*"],
      "policy_type": "whitelist"
    }
  ]
]

summary := {
  "message": helpers.get_multi_summary(conditions, vars.variables).message,
  "details": helpers.get_multi_summary(conditions, vars.variables).details
}
