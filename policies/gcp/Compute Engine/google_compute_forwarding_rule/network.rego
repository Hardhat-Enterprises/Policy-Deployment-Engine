package terraform.gcp.security.compute_engine.google_compute_forwarding_rule.network

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_forwarding_rule.vars

conditions := [
    [
        {
            "situation_description": "Forwarding Rule must explicitly set a VPC network rather than relying on the auto-created default network.",
            "remedies": [
                "Set network to an explicit, purpose-built VPC — the field must not be left blank.",
                "Leaving network unset falls back to the auto-mode 'default' network, which ships permissive firewall rules; use a custom-mode VPC with intentional segmentation."
            ]
        },
        {
            "condition": "network must be explicitly set and non-empty",
            "attribute_path": ["network"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
