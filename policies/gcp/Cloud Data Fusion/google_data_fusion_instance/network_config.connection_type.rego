package terraform.gcp.security.cloud_data_fusion.google_data_fusion_instance.network_config_connection_type

import data.terraform.helpers
import data.terraform.gcp.security.cloud_data_fusion.google_data_fusion_instance.vars

conditions := [
    [
        {
            "situation_description": "The Data Fusion instance is using an unapproved connection type",
            "remedies": [
                "Ensure to set 'connection_type' within the 'network_config' block",
                "Choose either 'VPC_PEERING' or 'PRIVATE_SERVICE_CONNECT_INTERFACES'"
            ]
        },
        {
            "condition": "Whitelist approved connection modes",
            "attribute_path": ["network_config", 0, "connection_type"], 
            "values": ["VPC_PEERING", "PRIVATE_SERVICE_CONNECT_INTERFACES"],
            "policy_type": "whitelist" 
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details