package terraform.gcp.security.network_services.google_network_services_http_route.hostnames

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_http_route.vars

conditions := [
    [
        {
            "situation_description": "The HTTP route's hostnames include a wildcard entry ('*'). An overly broad or wildcard hostname can cause traffic to be routed unexpectedly, a common source of misrouting and unintended exposure.",
            "remedies": [
                "Remove the wildcard '*' entry from hostnames.",
                "List only the specific, approved hostnames this route should match."
            ]
        },
        {
            "condition": "Check that no hostnames entry is a wildcard",
            "attribute_path": ["hostnames"],
            "values": ["*"],
            "policy_type": "element blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details