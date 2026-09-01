package terraform.gcp.security.network_services.google_network_services_wasm_plugin.min_log_level

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_wasm_plugin.vars

conditions := [
    [
        {
            "situation_description": "The Wasm Plugin should export security-relevant logs.",
            "remedies": [
                "Set log_config.min_log_level to INFO."
            ]
        },
        {
            "condition": "The log_config.min_log_level attribute must be set to INFO.",
            "attribute_path": [
                "log_config",
                0,
                "min_log_level"
            ],
            "values": [
                "INFO"
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details