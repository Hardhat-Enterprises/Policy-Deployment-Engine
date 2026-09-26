package terraform.gcp.security.compute_engine.google_compute_region_security_policy.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy.vars

conditions := [
    [
        {
            "situation_description": "Compute Region Security Policy allows deletion",
            "remedies": [
                "Set deletion_policy to PREVENT to protect the security policy from accidental deletion"
            ]
        },
        {
            "condition": "deletion_policy must be PREVENT",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details