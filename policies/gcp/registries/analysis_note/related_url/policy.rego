package terraform.gcp.security.registries.google_container_analysis_note.related_url

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analysis_note.related_url.vars

# STEP 1: Define the allowed URL for related_url
allowed_urls := [
    "https://github.com/Hardhat-Enterprises/Policy-Deployment-Engine/tree/gcp/service/cloud_vmware_engine/policies/gcp"  # Example of an allowed URL
]

# STEP 2: Define the conditions for related_url policy
conditions := [
    [
        {"situation_description": "Related URL does not match the allowed URL(s).",
        "remedies": ["Ensure related URL matches the allowed URL(s)."]},
        {
            "condition": "Check if related URL matches the allowed URLs",
            "attribute_path": ["related_url", "url"],
            "values": allowed_urls,  # Checking if the related URL matches the allowed URLs
            "policy_type": "whitelist"  # Policy type is whitelist because we are allowing only specific URLs
        }
    ]
]

# STEP 3: Use the helpers to generate a message summarizing the policy evaluation
# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resource's compliance to every condition and situation
# Useful for debugging
details := helpers.get_multi_summary(conditions, vars.variables).details