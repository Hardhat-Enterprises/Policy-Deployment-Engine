package terraform.gcp.security.cloud_data_fusion.data_fusion_instance_iam_binding.project
import data.terraform.helpers

import data.terraform.gcp.security.cloud_data_fusion.data_fusion_instance_iam_binding.vars

conditions := [
    [
        {
            "situation_description": "The IAM binding is targeting an unauthorized/external project",
            "remedies": ["Ensure the 'project' attribute to match the Hardhat Enterprises project ID"]
        },
        {
            "condition": "Ensure binding project matches the whitelist",
            "attribute_path": ["project"],
            "values": ["hardhat-enterprises-123"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details