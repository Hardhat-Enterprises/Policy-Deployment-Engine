package terraform.gcp.security.network_services.google_network_services_gateway.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_gateway.vars

conditions := [
    [
        {
            "situation_description": "The gateway should prevent accidental or malicious deletion through Terraform.",
            "remedies": [
                "Set deletion_policy to PREVENT."
            ]
        },
        {
            "condition": "The deletion_policy attribute must be PREVENT.",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details