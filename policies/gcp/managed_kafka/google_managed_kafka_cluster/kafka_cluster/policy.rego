package terraform.gcp.security.managed_kafka.google_managed_kafka_cluster.kafka_cluster

import data.terraform.gcp.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_cluster.vars

conditions := [

  # Situation 1 – Whitelist subnets using pattern-based path
  [
    {
      "situation_description": "Kafka clusters should use private subnets for better security.",
      "remedies": ["Ensure the subnet follows project/region/subnetwork/* pattern for private networking."]
    },
    {
      "condition": "network_configs.subnet must match private path",
      "attribute_path": ["gcp_config", "access_config", "network_configs", 0, "subnet"],
      "values": ["regex:^projects/.*/regions/.*/subnetworks/.*$"],
      "policy_type": "whitelist"
    }
  ],

  # Situation 2 – Whitelist for vCPU minimum
  [
    {
      "situation_description": "Kafka clusters should have at least 2 vCPUs for stable performance.",
      "remedies": ["Set vcpu_count to 2 or higher."]
    },
    {
      "condition": "vcpu_count >= 2",
      "attribute_path": ["capacity_config", "vcpu_count"],
      "values": ["range:2:*"],
      "policy_type": "whitelist"
    }
  ],

  # Situation 3 – Whitelist for memory minimum
  [
    {
      "situation_description": "Kafka clusters should have at least 2 GiB of memory for stable performance.",
      "remedies": ["Set memory_bytes to 2147483648 or higher."]
    },
    {
      "condition": "memory_bytes >= 2147483648",
      "attribute_path": ["capacity_config", "memory_bytes"],
      "values": ["range:2147483648:*"],
      "policy_type": "whitelist"
    }
  ]
]

summary := {
  "message": helpers.get_multi_summary(conditions, vars.variables).message,
  "details": helpers.get_multi_summary(conditions, vars.variables).details
}
