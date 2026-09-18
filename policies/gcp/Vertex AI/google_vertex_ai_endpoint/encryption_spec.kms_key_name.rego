package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.encryption_spec_kms_key_name

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.vars

conditions := [
    [
        {
            "situation_description": "Ensure KMS key is explicitly provided.",
            "remedies": ["Provide a non-empty `kms_key_name`."]
        },
        {
            "condition": "kms_key_name is empty or invalid literal",
            "attribute_path": ["encryption_spec", 0, "kms_key_name"],
            "values": ["", "not-a-real-key"],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Ensure KMS key follows the exact CMEK resource-path format.",
            "remedies": ["Use a valid CMEK key path matching projects/*/locations/*/keyRings/*/cryptoKeys/*."]
        },
        {
            "condition": "kms_key_name format is invalid",
            "attribute_path": ["encryption_spec", 0, "kms_key_name"],
            "values": ["projects/.*/locations/.*/keyRings/.*/cryptoKeys/.*"],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details