package terraform.gcp.security.cloud_data_fusion.data_fusion_instance.key_reference

import data.terraform.helpers
import data.terraform.gcp.security.cloud_data_fusion.data_fusion_instance.vars

conditions := [
    [
        {
            "situation_description": "The Data Fusion instance is not using the approved Hardhat encryption key.",
            "remedies": [
                "set 'key_reference' to: projects/hardhat-prod/locations/us-central1/keyRings/hardhat-ring/cryptoKeys/cdf-key"
            ]
        },
        {
            "condition": "Match approved KMS key exactly",
            "attribute_path": ["crypto_key_config", 0, "key_reference"], 
            "values": ["projects/hardhat-prod/locations/us-central1/keyRings/hardhat-ring/cryptoKeys/cdf-key"],
            "policy_type": "whitelist" 
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details