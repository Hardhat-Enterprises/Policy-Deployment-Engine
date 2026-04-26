package terraform.gcp.security.cloud_data_fusion.data_fusion_instance.labels

import data.terraform.helpers
import data.terraform.gcp.security.cloud_data_fusion.data_fusion_instance.vars

conditions := [
    [
        {
            "situation_description": "The Data Fusion instance 'env' label is either missing or incorrect",
            "remedies": [
                "Ensure the 'labels' block contains 'env'",
                "Set 'env' to one of the following: 'dev', 'test', 'prod'"
            ]
        },
        {
            "condition": "Whitelist approved environment labels",
            "attribute_path": ["labels", "env"], 
            "values": ["dev", "test", "prod"],
            "policy_type": "whitelist" 
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details