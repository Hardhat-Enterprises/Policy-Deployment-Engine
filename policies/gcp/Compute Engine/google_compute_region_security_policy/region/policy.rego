package terraform.gcp.security.compute_engine.google_compute_region_security_policy.region

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy.vars

conditions := [
    [
        {
            "situation_description": "Compute Region Security Policy is created outside the approved Australia regions.",
            "remedies": [
                "Use region 'australia-southeast1' or 'australia-southeast2' only."
            ]
        },
        {
            "condition": "Region must be whitelisted",
            "attribute_path": ["region"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details

