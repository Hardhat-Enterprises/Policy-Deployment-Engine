package terraform.gcp.security.compute_engine.google_compute_ha_vpn_gateway.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_ha_vpn_gateway.vars

conditions := [
    [
        {
            "situation_description": "The HA VPN gateway is not protected against Terraform-driven deletion, which could disrupt security-critical VPN connectivity and network availability.",
            "remedies": [
                "Set deletion_policy to PREVENT.",
                "Protect HA VPN gateways that provide security-critical connectivity between trusted networks from unintended Terraform-driven removal.",
                "Require an explicit lifecycle and security review before permitting deletion of a protected VPN gateway."
            ]
        },
        {
            "condition": "Check whether deletion_policy prevents deletion of the HA VPN gateway.",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

