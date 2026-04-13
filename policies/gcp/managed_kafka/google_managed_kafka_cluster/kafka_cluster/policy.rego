package terraform.gcp.security.managed_kafka.google_managed_kafka_cluster.kafka_cluster

import data.terraform.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_cluster.vars

conditions := [

  # Situation 1 – Blacklist empty subnets using pattern-based path
  [
    { "situation_description": "Kafka clusters should not use public IPs; private networking must be enabled for better security.", 
    "remedies": ["Set subnet inside network_configs to a private subnet."] 
    },
    { "condition": "network_configs.subnet must be defined", 
    "attribute_path": ["gcp_config", 0, "access_config", 0, "network_configs", 0, "subnet"],
     "values": [""], 
     "policy_type": "blacklist"
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
      "attribute_path": ["capacity_config", 0, "vcpu_count"],
      "values": [1, 2],
      "policy_type": "range"

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
      "attribute_path": ["capacity_config", 0, "memory_bytes"],
      "values": [2147483648, 8589934592],
      "policy_type": "range"

    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details