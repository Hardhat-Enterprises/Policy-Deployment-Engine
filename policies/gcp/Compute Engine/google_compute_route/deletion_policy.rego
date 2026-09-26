package terraform.gcp.security.compute_engine.google_compute_route.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_route.vars

conditions := [
    [
        {
            "situation_description": "Compute route deletion policy is not set to PREVENT, allowing deletion and risking disruption to network traffic.",
            "remedies": ["Set deletion_policy to PREVENT to block accidental or unauthorised deletion of the route."]
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