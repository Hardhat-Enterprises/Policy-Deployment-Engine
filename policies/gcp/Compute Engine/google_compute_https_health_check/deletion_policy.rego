package terraform.gcp.security.compute_engine.google_compute_https_health_check.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_https_health_check.vars

conditions := [
    [
        {
            "situation_description": "HTTPS health check can be destroyed by Terraform, risking loss of a live health-check control.",
            "remedies": [
                "Set deletion_policy to PREVENT."
            ]
        },
        {
            "condition": "Check if deletion_policy is PREVENT",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
