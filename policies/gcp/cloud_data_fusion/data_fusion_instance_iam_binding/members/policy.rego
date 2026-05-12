package terraform.gcp.security.cloud_data_fusion.data_fusion_instance_iam_binding.members
import data.terraform.helpers

import data.terraform.gcp.security.cloud_data_fusion.data_fusion_instance_iam_binding.vars

conditions := [
    [
        {
            "situation_description": "Public access detected in an IAM binding list",
            "remedies": ["Please remove 'allUsers' or 'allAuthenticatedUsers' from the members array."]
        },
        {
            "condition": "The members list must not contain anonymous identifiers",
            "attribute_path": ["members"],
            "values": ["allUsers", "allAuthenticatedUsers"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details