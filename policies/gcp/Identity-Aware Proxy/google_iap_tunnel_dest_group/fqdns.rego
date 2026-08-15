package terraform.gcp.security.identity_aware_proxy.google_iap_tunnel_dest_group.fqdns

import data.terraform.helpers
import data.terraform.gcp.security.identity_aware_proxy.google_iap_tunnel_dest_group.vars

conditions := [
    [
        {
            "situation_description": "The IAP tunnel destination group includes a wildcard FQDN pattern, allowing the tunnel to reach an unbounded set of hosts rather than a specific, approved destination.",
            "remedies": [
                "Remove wildcard entries from fqdns.",
                "List only the specific, approved hostnames that should be reachable through this tunnel group."
            ]
        },
        {
            "condition": "fqdns must not contain a wildcard pattern",
            "attribute_path": ["fqdns"],
            "values": ["*"],
            "policy_type": "element blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details