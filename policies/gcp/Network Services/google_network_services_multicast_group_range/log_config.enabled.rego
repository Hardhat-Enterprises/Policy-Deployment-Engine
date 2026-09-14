package terraform.gcp.security.network_services.google_network_services_multicast_group_range.log_config_enabled

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_multicast_group_range.vars

conditions := [
    [
        {
            "situation_description": "Logging is disabled for the multicast group range.",
            "remedies": [
                "Enable log_config.enabled so multicast group range activity is recorded for security monitoring and auditing."
            ]
        },
        {
            "condition": "multicast group range logging must be enabled",
            "attribute_path": ["log_config", 0, "enabled"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details