package terraform.gcp.security.managed_kafka.google_managed_kafka_connect_cluster.disallow_public_exposure 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_connect_cluster.vars


conditions := [

    # SCENARIO 1 — Restrict public endpoint
    [
        {
            "situation_description": "Kafka Connect clusters must not allow public internet exposure.",
            "remedies": [
                "Disable public_endpoint in the network configuration.",
                "Use private subnets and VPC peering for secure access."
            ]
        },
        {
            "condition": "Public endpoints must be disabled",
            "attribute_path": ["network_config", "public_endpoint"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ],

    # SCENARIO 2 — Enforce use of private subnets
    [
        {
            "situation_description": "Kafka Connect clusters must only use private RFC1918 subnets to restrict access to trusted networks.",
            "remedies": [
                "Ensure primary_subnet CIDR belongs to private ranges (10.0.0.0/8, 172.16.0.0/12, or 192.168.0.0/16)."
            ]
        },
        {
            "condition": "Primary subnet must be private",
            "attribute_path": ["gcp_config", "access_config", "network_configs", "primary_subnet"],
            "values": ["projects/my-project/regions/us-central1/subnetworks/private-subnet"],
            "policy_type": "whitelist"
        }
    ]
]

summary := {
    "message": helpers.get_multi_summary(conditions, vars.variables).message,
    "details": helpers.get_multi_summary(conditions, vars.variables).details
}
