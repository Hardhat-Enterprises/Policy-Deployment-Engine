package terraform.gcp.security.network_services.google_network_services_wasm_plugin.location

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_wasm_plugin.vars

conditions := [
    [
        {
            "situation_description": "The Wasm Plugin should be deployed only in approved locations.",
            "remedies": [
                "Deploy the Wasm Plugin in an approved region.",
                "Update the location attribute to an approved value."
            ]
        },
        {
            "condition": "The location attribute must use an approved region.",
            "attribute_path": ["location"],
            "values": [
                "australia-southeast1"
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details