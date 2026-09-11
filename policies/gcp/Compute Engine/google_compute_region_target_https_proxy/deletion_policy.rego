package terraform.gcp.security.compute_engine.google_compute_region_target_https_proxy.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_target_https_proxy.vars
conditions := [
    [
        {
            "situation_description": "Region target HTTPS proxy deletion policy is not set to PREVENT, allowing unrestricted deletion.",
            "remedies": ["Set deletion_policy to PREVENT to block accidental or unauthorised destruction of the HTTPS proxy."]
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