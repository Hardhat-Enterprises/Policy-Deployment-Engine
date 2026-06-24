package terraform.gcp.security.cloud_data_fusion.data_fusion_instance_iam_binding.role
import data.terraform.helpers

import data.terraform.gcp.security.cloud_data_fusion.data_fusion_instance_iam_binding.vars
conditions := [
    [
        {
            "situation_description": "An authoritative IAM binding is granting administrative power",
            "remedies": ["Use a more restrictive role such as 'roles/datafusion.viewer' or 'roles/datafusion.editor'."]
        },
        {
            "condition": "Not allow Owner and Editor roles in bindings",
            "attribute_path": ["role"],
            "values": ["roles/owner", "roles/editor"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details