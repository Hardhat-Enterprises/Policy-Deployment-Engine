package terraform.gcp.security.compute_engine.google_compute_external_vpn_gateway.interface_ip_address

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_external_vpn_gateway.vars

conditions := [
    [
        {
            "situation_description": "External VPN gateway interface uses an IP address that is not in the approved list of trusted VPN peer endpoints.",
            "remedies": ["Set interface ip_address to an approved external VPN peer IP to ensure connections only to trusted endpoints."]
        },
        {
            "condition": "interface ip_address must be an approved VPN peer IP.",
            "attribute_path": ["interface", 0, "ip_address"],
            "values": ["203.0.113.1"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details