package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.encryption_spec_kms_key_name

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.vars

conditions := [
    [
        {
            "situation_description": "Ensure the endpoint uses Customer-Managed Encryption Keys (CMEK).",
            "remedies": ["Configure the `encryption_spec.kms_key_name` attribute."]
        },
        {
            "condition": "encryption_spec.kms_key_name is empty",
            "attribute_path": ["encryption_spec", 0, "kms_key_name"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details