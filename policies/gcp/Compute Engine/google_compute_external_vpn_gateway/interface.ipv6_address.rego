package terraform.gcp.security.compute_engine.google_compute_external_vpn_gateway.interface_ipv6_address

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_external_vpn_gateway.vars

conditions := [
    [
        {
            "situation_description": "External VPN gateway interface uses an IPv6 address that is not in the approved list of trusted VPN peer endpoints.",
            "remedies": ["Set interface ipv6_address to an approved external VPN peer IPv6 address or remove it if IPv6 is not required."]
        },
        {
            "condition": "interface ipv6_address must be an approved VPN peer IPv6 address.",
            "attribute_path": ["interface", 0, "ipv6_address"],
            "values": ["2001:db8::1"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details