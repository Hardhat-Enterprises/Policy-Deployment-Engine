package terraform.gcp.security.compute_engine.google_compute_public_delegated_prefix.region

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_public_delegated_prefix.vars

conditions := [
    [
        {
            "situation_description": "Public delegated prefixes should only be deployed in an approved region.",
            "remedies": [
                "Set region to us-central1."
            ]
        },
        {
            "condition": "Require an approved region for the public delegated prefix.",
            "attribute_path": ["region"],
            "values": ["us-central1"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details