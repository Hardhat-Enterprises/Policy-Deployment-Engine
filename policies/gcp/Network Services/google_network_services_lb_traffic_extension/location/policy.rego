package terraform.gcp.security.google_network_services_lb_traffic_extension.location

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_lb_traffic_extension.vars

conditions := [
    [
        {
            "situation_description": "The LB Traffic Extension should be deployed only in approved locations.",
            "remedies": [
                "Deploy the LB Traffic Extension in an approved region.",
                "Update the location attribute to an approved value."
            ]
        },
        {
            "condition": "The location attribute must use an approved region.",
            "attribute_path": ["location"],
            "values": [
                "australia-southeast1"
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details