package terraform.gcp.security.network_services.google_network_services_multicast_group_range.require_explicit_accept

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_multicast_group_range.vars

conditions := [
    [
        {
            "situation_description": "The multicast group range does not require consumers to be explicitly accepted.",
            "remedies": [
                "Set require_explicit_accept to true so consumers must be explicitly approved before joining the multicast group range."
            ]
        },
        {
            "condition": "require_explicit_accept must be enabled",
            "attribute_path": ["require_explicit_accept"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details