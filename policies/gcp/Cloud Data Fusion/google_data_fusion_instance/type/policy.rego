package terraform.gcp.security.cloud_data_fusion.google_data_fusion_instance.type

import data.terraform.helpers
import data.terraform.gcp.security.cloud_data_fusion.google_data_fusion_instance.vars

conditions := [
    [
        {
            "situation_description": "The Data Fusion instance is using an unapproved instance type (e.g., ENTERPRISE).",
            "remedies": [
                "Change the 'type' attribute to 'BASIC' or 'DEVELOPER' in your terraform configuration.",
                "Verify the cost implications before requesting an exemption for ENTERPRISE types."
            ]
        },
        {
            "condition": "Validate that the Data Fusion instance type is within the approved tier list",
            "attribute_path": ["type"], 
            "values": ["BASIC", "DEVELOPER"],
            "policy_type": "whitelist" 
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details