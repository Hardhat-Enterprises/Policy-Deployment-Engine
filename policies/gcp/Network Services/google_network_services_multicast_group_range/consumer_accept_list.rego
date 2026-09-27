package terraform.gcp.security.network_services.google_network_services_multicast_group_range.consumer_accept_list

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_multicast_group_range.vars

conditions := [
    [
        {
            "situation_description": "The multicast group range consumer accept list contains an overly broad wildcard consumer.",
            "remedies": [
                "Remove wildcard consumer entries and configure only specific consumer projects."
            ]
        },
        {
            "condition": "consumer_accept_list must not contain wildcard consumer entries",
            "attribute_path": ["consumer_accept_list"],
            "values": ["*"],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details