package terraform.gcp.security.cloud_data_fusion.data_fusion_instance.enable_stackdriver_monitoring

import data.terraform.helpers
import data.terraform.gcp.security.cloud_data_fusion.data_fusion_instance.vars

conditions := [
    [
        {
            "situation_description": "Stackdriver Monitoring is disabled on the Data Fusion instance",
            "remedies": [
                "Please set the 'enable_stackdriver_monitoring' attribute to true in your configuration to ensure performance metrics are captured"
            ]
        },
        {
            "condition": "Enforce Stackdriver Monitoring",
            "attribute_path": ["enable_stackdriver_monitoring"], 
            "values": [true],
            "policy_type": "whitelist" 
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details