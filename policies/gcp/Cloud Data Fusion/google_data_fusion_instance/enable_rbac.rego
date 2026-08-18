package terraform.gcp.security.cloud_data_fusion.google_data_fusion_instance.enable_rbac

import data.terraform.helpers
import data.terraform.gcp.security.cloud_data_fusion.google_data_fusion_instance.vars

conditions := [
    [
        {
            "situation_description": "Granular Role-Based Access Control (RBAC) is disabled on the Data Fusion instance.",
            "remedies": [
                "Set the 'enable_rbac' attribute to true to allow for granular user permissions"
            ]
        },
        {
            "condition": "Enforce granular RBAC",
            "attribute_path": ["enable_rbac"], 
            "values": [true],
            "policy_type": "whitelist" 
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details