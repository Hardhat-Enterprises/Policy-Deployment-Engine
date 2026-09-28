package terraform.gcp.security.network_services.google_network_services_lb_route_extension.location

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_lb_route_extension.vars

conditions := [
    [
        {
            "situation_description": "The LB Route Extension is not configured in an approved deployment location.",
            "remedies": [
                "Deploy the LB Route Extension in an approved region.",
                "Use australia-southeast1 as the approved location for this policy."
            ]
        },
        {
            "condition": "location must use an approved region",
            "attribute_path": ["location"],
            "values": ["australia-southeast1"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details