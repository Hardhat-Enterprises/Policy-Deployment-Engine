package terraform.gcp.security.network_services.google_network_services_wasm_plugin.log_config_enable

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_wasm_plugin.vars

conditions := [
    [
        {
            "situation_description": "The Wasm Plugin should have logging enabled.",
            "remedies": [
                "Set log_config.enable to true."
            ]
        },
        {
            "condition": "The log_config.enable attribute must be set to true.",
            "attribute_path": [
                "log_config",
                0,
                "enable"
            ],
            "values": [
                true
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details