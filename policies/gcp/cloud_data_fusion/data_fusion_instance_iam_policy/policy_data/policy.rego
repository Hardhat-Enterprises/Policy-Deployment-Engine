package terraform.gcp.security.cloud_data_fusion.data_fusion_instance_iam_policy.policy_data

import data.terraform.helpers
import data.terraform.gcp.security.cloud_data_fusion.data_fusion_instance_iam_policy.vars

conditions := [
    [
        {
            "situation_description": "The authoritative policy data contains public access identifiers",
            "remedies": ["Please remove 'allUsers' or 'allAuthenticatedUsers' from the google_iam_policy data source."]
        },
        {
            "condition": "Detect public access in policy_data blob",
            "attribute_path": ["policy_data"],
            "values": ["{\"bindings\":[{\"members\":[\"allUsers\"],\"role\":\"roles/viewer\"}]}",
                       "{\"bindings\":[{\"members\":[\"allAuthenticatedUsers\"],\"role\":\"roles/viewer\"}]}"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details