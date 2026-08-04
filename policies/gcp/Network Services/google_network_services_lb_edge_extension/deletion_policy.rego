package terraform.gcp.security.google_network_services_lb_edge_extension.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_lb_edge_extension.vars

conditions := [
    [
        {
            "situation_description": "The LB Edge Extension should prevent accidental or unauthorized deletion.",
            "remedies": [
                "Set deletion_policy to PREVENT.",
                "Enable Terraform deletion protection for the resource."
            ]
        },
        {
            "condition": "The deletion_policy attribute must be set to PREVENT.",
            "attribute_path": ["deletion_policy"],
            "values": [
                "PREVENT"
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

