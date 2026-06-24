package terraform.gcp.security.cloud_data_fusion.data_fusion_instance_iam_member.member

import data.terraform.helpers
import data.terraform.gcp.security.cloud_data_fusion.data_fusion_instance_iam_member.vars

conditions := [
    [
        {
            "situation_description": "Data Fusion access is being granted to the public.",
            "remedies": ["Ensure to remove 'allUsers' or 'allAuthenticatedUsers' and use a specific corporate email."]
        },
        {
            "condition": "To disallow public access identifiers",
            "attribute_path": ["member"], 
            "values": ["allUsers", "allAuthenticatedUsers"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details