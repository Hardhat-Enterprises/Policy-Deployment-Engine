package terraform.gcp.security.cloud_data_fusion.data_fusion_instance.topic

import data.terraform.helpers
import data.terraform.gcp.security.cloud_data_fusion.data_fusion_instance.vars

conditions := [
    [
        {
            "situation_description": "The Pub/Sub topic for Data Fusion events is invalid or is pointing to an unapproved project",
            "remedies": [
                "Please ensure the topic is set to: projects/hardhat-prod/topics/certain-topic"
            ]
        },
        {
            "condition": "enforce Hardhat Topic",
            "attribute_path": ["event_publish_config", 0, "topic"],
            "values": ["projects/hardhat-prod/topics/certain-topic"],
            "policy_type": "whitelist" 
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details