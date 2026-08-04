package terraform.gcp.security.network_services.google_network_services_multicast_domain_group.project

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_multicast_domain_group.vars

conditions := [
    [
        {
            "situation_description": "The multicast domain group is not deployed in an approved GCP project. Deploying into an unapproved project can place the resource outside intended security boundaries or monitoring scope.",
            "remedies": [
                "Deploy the resource only into an approved, whitelisted GCP project.",
                "Confirm the target project is covered by org monitoring and security policies before applying."
            ]
        },
        {
            "condition": "Check if project is set to an approved project ID",
            "attribute_path": ["project"],
            "values": ["approved-prod-project"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details