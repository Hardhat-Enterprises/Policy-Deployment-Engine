package terraform.gcp.security.google_alloydb_instance.network_config.enable_outbound_public_ip

import data.terraform.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_instance.vars

conditions := [
    [
        {
            "situation_description": "The AlloyDB instance should not have outbound public IP connectivity enabled because unnecessary internet connectivity can increase external attack and data-exfiltration exposure.",
            "remedies": [
                "Disable outbound public IP connectivity for the AlloyDB instance.",
                "Set network_config.enable_outbound_public_ip to false."
            ]
        },
        {
            "condition": "The enable_outbound_public_ip attribute must be set to false.",
            "attribute_path": [
                "network_config",
                0,
                "enable_outbound_public_ip"
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