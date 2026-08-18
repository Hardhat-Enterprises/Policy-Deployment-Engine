package terraform.gcp.security.cloud_data_fusion.google_data_fusion_instance_iam_member.region

import data.terraform.helpers
import data.terraform.gcp.security.cloud_data_fusion.google_data_fusion_instance_iam_member.vars

conditions := [
    [
        {
            "situation_description": "IAM configuration is targeting an unauthorized region",
            "remedies": ["Please ensure the region attribute is set to 'australia-southeast1'"]
        },
        {
            "condition": "Ensure region is restricted to Australia",
            "attribute_path": ["region"],
            "values": ["australia-southeast1"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details