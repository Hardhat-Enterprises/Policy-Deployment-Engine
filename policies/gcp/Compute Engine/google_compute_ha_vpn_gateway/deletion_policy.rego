package terraform.gcp.security.compute_engine.google_compute_ha_vpn_gateway.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_ha_vpn_gateway.vars

conditions := [
    [
        {
            "situation_description": "The HA VPN gateway is not protected against accidental Terraform deletion.",
            "remedies": [
                "Set deletion_policy to PREVENT.",
                "Enable deletion protection for business-critical VPN gateways.",
                "Review lifecycle settings before allowing gateway deletion."
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

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details