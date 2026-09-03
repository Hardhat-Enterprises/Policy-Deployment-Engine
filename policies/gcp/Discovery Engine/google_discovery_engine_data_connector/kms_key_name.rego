package terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.kms_key_name

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.vars

# Require the KMS key to use a platform-approved location.
conditions := [
    [
        {
            "situation_description": "Does the connector use a KMS key in an approved location?",
            "remedies": ["Use a Cloud KMS key in an approved platform location."],
        },
        {
            "condition": "KMS key is outside the approved platform location",
            "attribute_path": ["kms_key_name"],
            "values": [
                "locations/*/keyRings/",
                [
                    ["australia-southeast1"],
                ],
            ],
            "policy_type": "pattern whitelist",
        },
    ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
