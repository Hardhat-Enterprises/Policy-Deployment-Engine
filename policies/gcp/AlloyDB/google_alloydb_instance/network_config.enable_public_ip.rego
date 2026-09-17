package terraform.gcp.security.google_alloydb_instance.network_config.enable_public_ip

import data.terraform.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_instance.vars

conditions := [
    [
        {
            "situation_description": "The AlloyDB instance should not be publicly accessible unless public exposure is explicitly required and justified.",
            "remedies": [
                "Disable public IP connectivity for the AlloyDB instance.",
                "Set network_config.enable_public_ip to false.",
                "If public access is required, ensure the exposure is explicitly approved and appropriately restricted."
            ]
        },
        {
            "condition": "The enable_public_ip attribute must be set to false.",
            "attribute_path": [
                "network_config",
                0,
                "enable_public_ip"
            ],
            "values": [
                false
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details