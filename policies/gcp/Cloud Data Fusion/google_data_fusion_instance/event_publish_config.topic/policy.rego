package terraform.gcp.security.cloud_data_fusion.google_data_fusion_instance.event_publish_config_topic

import data.terraform.helpers
import data.terraform.gcp.security.cloud_data_fusion.google_data_fusion_instance.vars

conditions := [
    [
        {
            "situation_description": "The Pub/Sub topic for Data Fusion events is invalid or is pointing to an unapproved project",
            "remedies": [
                "Ensure the topic follows the format: projects/{project_id}/topics/{topic_id}",
                "The project must be 'hardhat-prod' and the topic must be 'certain-topic'"
            ]
        },
        {
            "condition": "Enforce Hardhat Topic Pattern",
            "attribute_path": ["event_publish_config", 0, "topic"],
            "values": [
                "projects/*/topics/*", 
                [
                    ["hardhat-prod"], ["certain-topic"]
                ]
            ],
            "policy_type": "pattern whitelist" 
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details
