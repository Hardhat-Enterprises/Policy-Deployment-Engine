package terraform.gcp.security.compute_engine.google_compute_organization_security_policy.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_organization_security_policy.vars

conditions := [
    [
        {
            "situation_description": "Organization security policy can be destroyed by Terraform, risking loss of org-wide security controls.",
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
