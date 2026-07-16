package terraform.gcp.security.compute_engine.google_compute_forwarding_rule.network

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_forwarding_rule.vars

conditions := [
    [
        {
            "situation_description": "Forwarding Rule must not rely on the auto-created default VPC network.",
            "remedies": [
                "Set network to an explicit, purpose-built VPC instead of leaving it unset.",
                "The auto-mode 'default' network ships permissive firewall rules; use a custom-mode VPC with intentional segmentation."
            ]
        },
        {
            "condition": "network must not be the default network",
            "attribute_path": ["network"],
            "values": ["default"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
