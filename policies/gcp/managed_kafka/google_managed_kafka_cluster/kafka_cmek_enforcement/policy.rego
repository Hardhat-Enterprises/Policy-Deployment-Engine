package terraform.gcp.security.managed_kafka.google_managed_kafka_cluster.kafka_cmek_enforcement

import data.terraform.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_cluster.vars

conditions := [

  # SITUATION 1 – Whitelist allowed Kafka cluster regions
  [
    {
      "situation_description": "Kafka clusters should be deployed only in approved regions for compliance and security.",
      "remedies": ["Use one of the approved regions: us-central1, europe-west1, asia-southeast1."]
    },
    {
      "condition": "location must be in approved list",
      "attribute_path": ["location"],
      "values": ["us-central1", "europe-west1", "asia-southeast1"],
      "policy_type": "whitelist"
    }
  ],

  # SITUATION 2 – Enforce CMEK key region matches Kafka region
  [
    {
      "situation_description": "Kafka clusters using CMEK must ensure that the CMEK key region matches the cluster's region.",
      "remedies": ["Ensure CMEK keys are stored in the same region as the Kafka cluster."]
    },
    {
      "condition": "location is a region that requires CMEK alignment",
      "attribute_path": ["location"],
      "values": ["us-central1", "australia-southeast1"],
      "policy_type": "whitelist"
    },
    {
      "condition": "CMEK key name must follow the regional pattern for matching",
      "attribute_path": ["encryption_config", "kms_key_name"],
      "values": [
        "projects/*/locations/*/keyRings/*/cryptoKeys/*",
        [
          ["project-1", "project-2"],         # allowed project IDs
          ["us-central1", "australia-southeast1"],  # allowed locations (regions)
          ["ring-1", "ring-2"],              # allowed key rings
          ["key-1", "key-2"]                 # allowed crypto keys
        ]
      ],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details