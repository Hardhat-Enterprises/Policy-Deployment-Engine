package terraform.gcp.security.cloud_data_fusion.data_fusion_instance_iam_member.role

import data.terraform.helpers
import data.terraform.gcp.security.cloud_data_fusion.data_fusion_instance_iam_member.vars

conditions := [
    [
        {
            "situation_description": "A high-privilege administrative role is being assigned.",
            "remedies": ["Downgrade the role to 'roles/datafusion.viewer' or a specific Data Fusion user role"]
        },
        {
            "condition": "Disallow Owner and Editor roles for individual members",
            "attribute_path": ["role"],
            "values": ["roles/owner", "roles/editor"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details