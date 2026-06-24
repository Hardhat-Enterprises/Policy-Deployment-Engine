package terraform.gcp.security.cloud_data_fusion.google_data_fusion_instance.enable_stackdriver_logging

import data.terraform.helpers
import data.terraform.gcp.security.cloud_data_fusion.google_data_fusion_instance.vars

conditions := [
    [
        {
            "situation_description": "Stackdriver Logging is disabled on the Data Fusion instance.",
            "remedies": [
                "Set the 'enable_stackdriver_logging' attribute to true in your configuration"
            ]
        },
        {
            "condition": "Enforce Stackdriver Logging",
            "attribute_path": ["enable_stackdriver_logging"], 
            "values": [true],
            "policy_type": "whitelist" 
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details