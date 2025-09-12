package terraform.gcp.security.managed_kafka.google_managed_kafka_cluster.kafka_cluster 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_cluster.vars


conditions := [
    [
        {
            "situation_description": "Kafka clusters should not use public IPs; private networking must be enabled for better security.",
            "remedies": ["Set subnet inside network_configs to a private subnet."]
        },
        {
            "condition": "network_configs.subnet must be defined",
            "attribute_path": ["gcp_config", "access_config", "network_configs", 0, "subnet"],
            "values": [""],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Kafka clusters should have sufficient resources to handle workloads securely.",
            "remedies": ["Ensure vCPU >= 2 and memory >= 2GB for better stability and security."]
        },
        {
            "condition": "vcpu_count >= 2 and memory_bytes >= 2147483648",
            "attribute_path": ["capacity_config"],
            "values": [""],
            "policy_type": "whitelist"
        }
    ]
]
summary := {
  "message": helpers.get_multi_summary(conditions, vars.variables).message,
  "details": helpers.get_multi_summary(conditions, vars.variables).details
}

  