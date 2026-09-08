package terraform.gcp.security.compute_engine.google_compute_region_security_policy_rule.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy_rule.vars

conditions := [
    [
        {
            "situation_description": "The regional security policy rule is not protected against destructive Terraform deletion.",
            "remedies": [
                "Set deletion_policy to PREVENT for security rules that must remain enforced.",
                "Require an explicit review before permitting deletion of an active security control.",
                "Use a controlled decommissioning process before removing protection rules."
            ]
        },
        {
            "condition": "Require protection against destructive Terraform deletion.",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
