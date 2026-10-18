package terraform.gcp.security.compute_engine.google_compute_external_vpn_gateway.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_external_vpn_gateway.vars
conditions := [
    [
        {
            "situation_description": "External VPN gateway deletion policy is not set to PREVENT, allowing unrestricted deletion and risking loss of VPN connectivity.",
            "remedies": ["Set deletion_policy to PREVENT to block accidental or unauthorised destruction of the VPN gateway."]
        },
        {
            "condition": "deletion_policy must be set to PREVENT.",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details