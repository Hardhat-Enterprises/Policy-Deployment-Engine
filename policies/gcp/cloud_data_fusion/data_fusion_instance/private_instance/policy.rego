package terraform.gcp.security.cloud_data_fusion.data_fusion_instance.private_instance

import data.terraform.helpers
import data.terraform.gcp.security.cloud_data_fusion.data_fusion_instance.vars

conditions := [
    [
        {
            "situation_description": "The Data Fusion instance is not configured as a private instance",
            "remedies": [
                "Set the 'private_instance' attribute to true",
                "Please ensure that a network_config block is provided to handle the private peering/PSC."
            ]
        },
        {
            "condition": "Enforce private instance connectivity",
            "attribute_path": ["private_instance"], 
            "values": [true],
            "policy_type": "whitelist" 
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details