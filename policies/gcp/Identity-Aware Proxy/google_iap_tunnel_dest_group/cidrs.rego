package terraform.gcp.security.identity_aware_proxy.google_iap_tunnel_dest_group.cidrs

import data.terraform.helpers
import data.terraform.gcp.security.identity_aware_proxy.google_iap_tunnel_dest_group.vars

conditions := [
    [
        {
            "situation_description": "The IAP tunnel destination group includes an overly broad CIDR (0.0.0.0/0), reaching every address on the network and massively expanding the blast radius of the tunnel.",
            "remedies": [
                "Remove 0.0.0.0/0 from cidrs.",
                "List only the specific, approved subnets that should be reachable through this tunnel group."
            ]
        },
        {
            "condition": "cidrs must not include the unrestricted range 0.0.0.0/0",
            "attribute_path": ["cidrs"],
            "values": ["0.0.0.0/0"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details