package terraform.gcp.security.oslogin.google_compute_instance.restrict_external_ip

import data.terraform.helpers
import data.terraform.gcp.security.oslogin.google_compute_instance.vars

conditions := [
    [
        {
            "situation_description": "Instances with OS Login must not expose external IP addresses unless whitelisted",
            "remedies": [
                "Remove access_config from network_interface for non-whitelisted IPs",
                "Use private IPs only or add to whitelist"
            ]
        },
        {
            "condition": "Check network_interface has no access_config or is whitelisted",
            "attribute_path": ["network_interface", 0, "access_config", 0, "nat_ip"],
            "values": ["127.0.0.1"], 
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

