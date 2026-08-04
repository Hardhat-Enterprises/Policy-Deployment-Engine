package terraform.gcp.security.network_services.google_network_services_multicast_domain_group.location

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_multicast_domain_group.vars

conditions := [
    [
        {
            "situation_description": "The multicast domain group is not deployed in an approved region. Deploying outside approved regions can violate data residency requirements.",
            "remedies": [
                "Deploy the resource only into an approved region (e.g. australia-southeast1) or 'global' where applicable.",
                "Confirm data residency requirements before choosing a region."
            ]
        },
        {
            "condition": "Check if location is set to an approved region",
            "attribute_path": ["location"],
            "values": ["australia-southeast1", "global"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details