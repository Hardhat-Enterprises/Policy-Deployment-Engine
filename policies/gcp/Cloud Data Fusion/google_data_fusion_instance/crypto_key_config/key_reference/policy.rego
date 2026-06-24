package terraform.gcp.security.cloud_data_fusion.data_fusion_instance.key_reference

import data.terraform.helpers
import data.terraform.gcp.security.cloud_data_fusion.data_fusion_instance.vars

conditions := [
    [
        {
            "situation_description": "The Data Fusion instance is not using an approved Hardhat KMS encryption key/the resource path is malformed",
            "remedies": [
                "Please Ensure the key_reference follows the format: projects/{project}/locations/{location}/keyRings/{ring}/cryptoKeys/{key}",
                "The key must be located in 'hardhat-prod' within 'australia-southeast1' using the 'hardhat-ring'"
            ]
        },
        {
            "condition": "enforce Hardhat KMS Key Pattern",
            "attribute_path": ["crypto_key_config", 0, "key_reference"],
            "values": [
                "projects/*/locations/*/keyRings/*/cryptoKeys/*", 
                [
                    ["hardhat-prod"], ["australia-southeast1"], ["hardhat-ring"], ["cdf-key"]
                ]
            ],
            "policy_type": "pattern whitelist" 
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details