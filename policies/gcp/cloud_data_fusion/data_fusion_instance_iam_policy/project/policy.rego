package terraform.gcp.security.cloud_data_fusion.data_fusion_instance_iam_policy.project

import data.terraform.helpers
import data.terraform.gcp.security.cloud_data_fusion.data_fusion_instance_iam_policy.vars

conditions := [
    [
        {
            "situation_description": "The IAM policy is targeting a project outside of the Hardhat Enterprises environment",
            "remedies": ["Change the 'project' attribute to 'hardhat-enterprises-123'"]
        },
        {
            "condition": "Verify resource is deployed within the approved project perimeter",
            "attribute_path": ["project"],
            "values": ["hardhat-enterprises-123"],
            "policy_type": "whitelist" 
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details