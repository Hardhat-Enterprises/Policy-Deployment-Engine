package terraform.gcp.security.cloud_data_fusion.data_fusion_instance.event_publish_config_enabled

import data.terraform.helpers
import data.terraform.gcp.security.cloud_data_fusion.data_fusion_instance.vars

conditions := [
    [
        {
            "situation_description": "Cloud Data Fusion Event Publishing is disabled/misconfigured.",
            "remedies": [
                "Please ensure 'enabled' is set to true",
            ]
        },
        {
            "condition": "Enforce Event Publishing Enabled",
            "attribute_path": ["event_publish_config", 0, "enabled"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details