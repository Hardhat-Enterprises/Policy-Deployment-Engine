package terraform.gcp.security.compute_engine.google_compute_global_address.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_global_address.vars

conditions := [
    [
        {
            "situation_description": "Global address deletion policy is not set to PREVENT, allowing deletion and risking disruption to services that depend on the reserved address.",
            "remedies": ["Set deletion_policy to PREVENT to block accidental or unauthorised deletion of the global address."]
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