package terraform.gcp.security.compute_engine.google_compute_ha_vpn_gateway.region

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_ha_vpn_gateway.vars

conditions := [
    [
        {
            "situation_description": "The HA VPN gateway is deployed outside the approved regional baseline.",
            "remedies": [
                "Deploy the HA VPN gateway in an approved region.",
                "Review organisational location and data residency requirements.",
                "Update the approved region list when business or compliance requirements change."
            ]
        },
        {
            "condition": "Check whether the HA VPN gateway is deployed in an approved region.",
            "attribute_path": ["region"],
            "values": [
                "australia-southeast1",
                "australia-southeast2"
            ],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details