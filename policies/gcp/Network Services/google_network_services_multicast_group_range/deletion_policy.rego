package terraform.gcp.security.network_services.google_network_services_multicast_group_range.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_multicast_group_range.vars

conditions := [
    [
        {
            "situation_description": "The multicast group range does not prevent destructive deletion.",
            "remedies": [
                "Set deletion_policy to PREVENT to protect the multicast group range from accidental destruction."
            ]
        },
        {
            "condition": "deletion_policy must prevent destructive deletion",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
