package terraform.gcp.security.memcache.google_memcache_instance.authorized_network

import data.terraform.helpers
import data.terraform.gcp.security.memcache.google_memcache_instance.vars

conditions := [
    [
        {
            "situation_description": "The Memcache instance is connected to the implicit default VPC network, which has broad, permissive built-in firewall rules rather than a deliberately scoped, trusted network.",
            "remedies": [
                "Set authorized_network to a specific, purpose-built VPC network rather than the default network.",
                "Restrict access to the instance to only the networks that genuinely need it."
            ]
        },
        {
            "condition": "authorized_network must not be the default network",
            "attribute_path": ["authorized_network"],
            "values": ["default"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details