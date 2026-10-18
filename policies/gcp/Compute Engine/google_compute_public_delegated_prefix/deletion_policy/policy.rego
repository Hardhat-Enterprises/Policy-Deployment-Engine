package terraform.gcp.security.compute_engine.google_compute_public_delegated_prefix.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_public_delegated_prefix.vars

conditions := [
    [
        {
            "situation_description": "Public delegated prefixes should be protected from accidental deletion.",
            "remedies": [
                "Set deletion_policy to PREVENT."
            ]
        },
        {
            "condition": "Require deletion protection for the public delegated prefix.",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details