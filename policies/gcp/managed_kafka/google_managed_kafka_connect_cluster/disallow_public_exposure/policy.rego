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
      "situation_description": "Kafka Connect clusters should not use public subnetworks.",
      "remedies": ["Assign only private subnetworks within VPC."]
        },
        {
        "condition": "network_configs.subnet must match pattern",
        "attribute_path": ["network_configs", 0, "subnet"],
        "values": [
            "projects/*/regions/*/subnetworks/private-*",
            "projects/*/regions/*/subnetworks/subnet-*"
        ],
        "policy_type": "whitelist" 
        }
    ]
]

summary := {
    "message": helpers.get_multi_summary(conditions, vars.variables).message,
    "details": helpers.get_multi_summary(conditions, vars.variables).details
}
