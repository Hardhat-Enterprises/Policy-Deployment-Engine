package terraform.gcp.security.oslogin.google_compute_instance.restrict_external_ip

import data.terraform.gcp.helpers
import data.terraform.gcp.security.oslogin.google_compute_instance.vars

# Scenario: Instances must not have external IPs when OS Login is enabled
conditions := [
    [
        {
            "situation_description": "Instances with OS Login must not expose external IP addresses",
            "remedies": [
                "Remove access_config from network_interface",
                "Use private IPs only"
            ]
        },
        {
            "condition": "Check network_interface has no access_config",
            "attribute_path": ["network_interface", 0, "access_config"],
            "values": [null],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

