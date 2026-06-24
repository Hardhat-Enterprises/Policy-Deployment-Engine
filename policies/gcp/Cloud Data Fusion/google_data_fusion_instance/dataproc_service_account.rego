package terraform.gcp.security.cloud_data_fusion.google_data_fusion_instance.dataproc_service_account

import data.terraform.helpers
import data.terraform.gcp.security.cloud_data_fusion.google_data_fusion_instance.vars
 
conditions := [
    [
        {
            "situation_description": "The Data Fusion instance is utilising a blacklisted default Google service account",
            "remedies": [
                "Please replace the default compute service account with a custom, least-privileged IAM service account"
            ]
        },
        {
            "condition": "Blacklist default compute service accounts",
            "attribute_path": ["dataproc_service_account"], 
            "values": ["*-*@*", [[], ["compute"], ["developer.gserviceaccount.com"]]],
            "policy_type": "pattern blacklist" 
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details