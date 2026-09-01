package terraform.gcp.security.compute_engine.google_compute_network_peering.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_peering.vars
conditions := [
    [
        {
            "situation_description": "Network peering deletion policy is not set to PREVENT, allowing unrestricted deletion and risking loss of peering connectivity.",
            "remedies": ["Set deletion_policy to PREVENT to block accidental or unauthorised destruction of the peering connection."]
        },
        {
            "condition": "deletion_policy must be set to PREVENT.",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details