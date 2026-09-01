package terraform.gcp.security.compute_engine.google_compute_external_vpn_gateway.redundancy_type
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_external_vpn_gateway.vars
conditions := [
    [
        {
            "situation_description": "External VPN gateway does not use a resilient redundancy configuration, risking single-point VPN tunnel failure.",
            "remedies": ["Set redundancy_type to FOUR_IPS_REDUNDANCY or TWO_IPS_REDUNDANCY to ensure VPN connectivity resilience."]
        },
        {
            "condition": "redundancy_type must use a multi-IP redundancy configuration.",
            "attribute_path": ["redundancy_type"],
            "values": ["FOUR_IPS_REDUNDANCY", "TWO_IPS_REDUNDANCY"],
            "policy_type": "whitelist"
        }
    ]
]
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details