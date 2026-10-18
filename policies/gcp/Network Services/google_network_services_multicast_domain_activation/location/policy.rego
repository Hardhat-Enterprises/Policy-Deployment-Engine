package terraform.gcp.security.network_services.google_network_services_multicast_domain_activation.location

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_multicast_domain_activation.vars

conditions := [
    [
        {
            "situation_description": "The multicast domain activation is deployed outside the approved location.",
            "remedies": [
                "Deploy the multicast domain activation in an approved zone.",
                "Review organisational data residency and regional deployment requirements."
            ]
        },
        {
            "condition": "location must use an approved zone",
            "attribute_path": ["location"],
            "values": ["us-central1-b"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
