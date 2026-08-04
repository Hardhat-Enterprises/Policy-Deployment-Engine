package terraform.gcp.security.network_services.google_network_services_wasm_plugin.sample_rate

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_wasm_plugin.vars

conditions := [
    [
        {
            "situation_description": "The Wasm Plugin should log sufficient activity for auditing.",
            "remedies": [
                "Set log_config.sample_rate to 1.0."
            ]
        },
        {
            "condition": "The log_config.sample_rate attribute must be set to 1.0.",
            "attribute_path": [
                "log_config",
                0,
                "sample_rate"
            ],
            "values": [
                1.0
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details