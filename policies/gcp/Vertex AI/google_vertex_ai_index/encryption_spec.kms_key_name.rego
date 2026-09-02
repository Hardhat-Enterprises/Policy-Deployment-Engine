package terraform.gcp.security.vertex_ai.google_vertex_ai_index.encryption_spec_kms_key_name

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_index.vars

conditions := [
    [
        {
            "situation_description": "Ensure the endpoint uses Customer-Managed Encryption Keys (CMEK) and matches the correct structural pattern.",
            "remedies": ["Configure the `encryption_spec.kms_key_name` attribute to match the CMEK structural pattern (`projects/*/locations/*/keyRings/*/cryptoKeys/*`)."]
        },
        {
            "condition": "encryption_spec.kms_key_name must be configured (presence check)",
            "attribute_path": ["encryption_spec", 0, "kms_key_name"],
            "values": [""],
            "policy_type": "blacklist"
        },
        {
            "condition": "encryption_spec.kms_key_name must match the CMEK structural pattern",
            "attribute_path": ["encryption_spec", 0, "kms_key_name"],
            "values": ["^projects/.*/locations/.*/keyRings/.*/cryptoKeys/.*$"],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details