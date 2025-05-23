package terraform.gcp.security.registries.google_container_analysis_note.related_url

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analysis_note.related_url.vars

allowed_urls := [
    "https://github.com/Hardhat-Enterprises/Policy-Deployment-Engine/tree/gcp/service/cloud_vmware_engine/policies/gcp"  
]

conditions := [
    [
        {"situation_description": "Related URL does not match the allowed URL(s).",
        "remedies": ["Ensure related URL matches the allowed URL(s)."]},
        {
            "condition": "Check if related URL matches the allowed URLs",
            "attribute_path": ["related_url", 0, "url"],  
            "values": allowed_urls, 
            "policy_type": "whitelist" 
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
