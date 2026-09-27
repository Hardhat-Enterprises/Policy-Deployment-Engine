package terraform.gcp.security.network_services.google_network_services_multicast_domain_activation.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_multicast_domain_activation.vars

conditions := [
    [
        {
            "situation_description": "The multicast domain activation does not prevent destructive deletion.",
            "remedies": [
                "Set deletion_policy to PREVENT to protect the resource from accidental destruction."
            ]
        },
        {
            "condition": "deletion_policy must prevent resource destruction",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details