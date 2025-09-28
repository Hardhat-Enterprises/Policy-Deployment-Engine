package terraform.gcp.security.analytics_hub.data_exchange.public_discovery_restriction

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.data_exchange.vars

conditions := [
    [
        {
            "situation_description": "c2: Data Exchange must not be publicly discoverable unless explicitly approved",
            "remedies": [
                "Avoid setting discovery_type to DISCOVERY_TYPE_PUBLIC unless approved by governance",
                "Use DISCOVERY_TYPE_PRIVATE for internal or restricted exchanges"
            ]
        },
        {
            "condition": "Check if discovery_type is restricted",
            "attribute_path": ["discovery_type"],
            "values": [
                "DISCOVERY_TYPE_PRIVATE"
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

# Compliance summary
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed evaluation
details := helpers.get_multi_summary(conditions, vars.variables).details
