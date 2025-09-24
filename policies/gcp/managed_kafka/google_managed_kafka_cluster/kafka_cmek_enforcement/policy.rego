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
  
   # S2: Enforce CMEK region alignment using conditional trigger + pattern whitelist
  [
    {
      "situation_description": "Kafka clusters using CMEK must ensure that the CMEK key region matches the cluster's region.",
      "remedies": ["Ensure CMEK keys are stored in the same region as the Kafka cluster."]
    },
    {
      "condition": "Cluster region is not in approved list → triggers CMEK check",
      "attribute_path": ["location"],
      "values": ["us-central1", "australia-southeast1"],
      "policy_type": "blacklist"
    },
    {
      "condition": "CMEK key must follow location pattern",
      "attribute_path": ["encryption_config", "kms_key_name"],
      "values": ["projects/*/locations/us-central1/keyRings/*/cryptoKeys/*",
                 "projects/*/locations/australia-southeast1/keyRings/*/cryptoKeys/*"],
      "policy_type": "pattern whitelist"
    }
  ]
]

summary := {
  "message": helpers.get_multi_summary(conditions, vars.variables).message,
  "details": helpers.get_multi_summary(conditions, vars.variables).details
}
